using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEditor;
using UnityEditor.VersionControl;
using UnityEngine;
static class Extensions
{
    public static IList<T> Clone<T>(this IList<T> listToClone) where T : ICloneable
    {
        return listToClone.Select(item => (T)item.Clone()).ToList();
    }
}
public class Sample : ICloneable
{
    public Vector3 Position;
    public float Size;
    public Vector3 Color;

    public object Clone()
    {
        var newSample = new Sample();
        newSample.Position = Position;
        newSample.Size = Size;
        newSample.Color = Color;
        return newSample;
    }
}

public class MetaShadHeur : AShaderGen
{
    public UnityEngine.Object CompareImage;
    public RenderTexture RenderTexture;
    public Texture InputTexture;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Start");
        _templateCode = File.ReadAllText("Assets/MetaShadHeur/TemplateMetaShadHeur.shader");
        _templateCode = _templateCode.Replace("{", "{{").Replace("}", "}}")
            .Replace("[0]", "{0}")
            .Replace("[1]", "{1}")
            .Replace("[2]", "{2}");

    }

    string _templateCode;
    IList<Sample> _samples;

    public override void GenerateShaderCode(string outputPath, string shaderName)
    {

        StringBuilder sbMap = new StringBuilder(_samples.Count * 500);

        for (int i = 0; i < _samples.Count; ++i)
        {
            var pos = _samples[i].Position;
            var position = $"p-float3({pos.x}, {pos.y}, {pos.z})";
            sbMap.AppendLine($"acc = _min(acc, float2(length({position}) - {_samples[i].Size}, {i}.));");
        }


        StringBuilder sbRender = new StringBuilder(_samples.Count * 100);
        sbRender.AppendLine($"float3 cols[{_samples.Count}];");
        for (int i = 0; i < _samples.Count; ++i)
            sbRender.AppendLine($"cols[{i}] = float3({_samples[i].Color.x}, {_samples[i].Color.y}, {_samples[i].Color.z});");

        var newText = String.Format(_templateCode, shaderName, sbMap.ToString(), sbRender.ToString());
        //var newText = _templateCode
        //.Replace("{0}", shaderName)
        //.Replace("{1}", sbMap.ToString())
        //.Replace("{2}", sbRender.ToString());

        File.WriteAllText(outputPath, newText);
    }

    private List<Sample> _generateInitialState()
    {
        var samples = new List<Sample>();
        for (int j = 0; j < 42; ++j)
        {
            var sample = new Sample();
            sample.Size = UnityEngine.Random.Range(0.1f, 2.0f);
            float posLim = 5.0f;
            sample.Position.x = UnityEngine.Random.Range(-posLim, posLim);
            sample.Position.y = UnityEngine.Random.Range(-posLim, posLim);
            sample.Position.z = UnityEngine.Random.Range(0.0f, posLim);

            sample.Color.x = UnityEngine.Random.Range(0.0f, 1.0f);
            sample.Color.y = UnityEngine.Random.Range(0.0f, 1.0f);
            sample.Color.z = UnityEngine.Random.Range(0.0f, 1.0f);
            samples.Add(sample);
        }
        return samples;
    }
    private IList<Sample> _mutate(IList<Sample> samples)
    {
        samples = samples.Clone();
        int changes = 1;
        for (int i = 0; i < changes; ++i)
        {
            var sample = samples[UnityEngine.Random.Range(0, samples.Count)];
            var propertyChange = UnityEngine.Random.Range(0, 3);
            //if (propertyChange == 0)
            {
                sample.Color.x = UnityEngine.Random.Range(0.0f, 1.0f);
                sample.Color.y = UnityEngine.Random.Range(0.0f, 1.0f);
                sample.Color.z = UnityEngine.Random.Range(0.0f, 1.0f);
            }
            //if (propertyChange == 1)
            {
                float posLim = 5.0f;
                sample.Position.x = UnityEngine.Random.Range(-posLim, posLim);
                sample.Position.y = UnityEngine.Random.Range(-posLim, posLim);
                sample.Position.z = UnityEngine.Random.Range(0.0f, posLim);
            }
            //if (propertyChange == 2)
                sample.Size = UnityEngine.Random.Range(0.1f, 2.0f);
        }
        return samples;
    }

    private float _measureEnergy(int i)
    {
        var outputImgPath = $@"C:\TMPImages\shader{i}METASHADHEUR.png";
        var compareImgPath = AssetDatabase.GetAssetPath(CompareImage);
        string diffCmd = $"/C magick composite  {outputImgPath} {compareImgPath} -compose subtract C:\\TMPImages\\difference.png";
        var processDiff = new System.Diagnostics.Process();
        processDiff.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
        processDiff.StartInfo.CreateNoWindow = true;
        processDiff.StartInfo.FileName = "CMD.exe";
        processDiff.StartInfo.Arguments = diffCmd;
        processDiff.StartInfo.UseShellExecute = false;
        processDiff.Start();
        processDiff.WaitForExit();

        string scoreCmd = $"/C magick identify -format \" %[fx: mean]\" C:\\TMPImages\\difference.png";
        //Create process
        System.Diagnostics.Process process = new System.Diagnostics.Process();
        process.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
        process.StartInfo.CreateNoWindow = true;
        process.StartInfo.FileName = "CMD.exe";
        process.StartInfo.Arguments = scoreCmd;
        process.StartInfo.UseShellExecute = false;
        process.StartInfo.RedirectStandardOutput = true;
        process.StartInfo.RedirectStandardError = true;
        process.Start();
        string output = process.StandardOutput.ReadToEnd();
        Debug.Log("Yeah  => :" + output + ":" + process.StandardError.ReadToEnd());
        process.WaitForExit();
        return float.Parse(output);
    }

    IEnumerator _corout()
    {
        _samples = _generateInitialState();
        float temperature = 200.0f;
        IList<Sample> bestSolution = _samples;
        float bestEnergy = 100.0f;
        for (int i = 0; bestEnergy > 0.05f; ++i)
        {
            _samples = _mutate(bestSolution);
            temperature *= 0.99f;

            Render($"shader{i}", "METASHADHEUR", @"C:\TMPImages\", RenderTexture, InputTexture, i == 0);

            float curEnergy = _measureEnergy(i);
            Debug.Log($"Cur energy {curEnergy} best:{bestEnergy} temp:{temperature}");
            float deltaEnergy = curEnergy - bestEnergy;
            if (deltaEnergy < 0.0f || UnityEngine.Random.Range(0.0f,1.0f) > Mathf.Exp(-deltaEnergy/temperature))
            {
                bestEnergy = curEnergy;
                bestSolution = _samples;
                Debug.Log($"Found solution cur:{curEnergy} temp:{temperature}");
                Render($"shaderFinal", "METASHADHEUR", @"C:\TMPImages\", RenderTexture, InputTexture);
            }
            yield return new WaitForEndOfFrame();
        }

        _samples = bestSolution;
        Render($"shaderFinal", "METASHADHEUR", @"C:\TMPImages\", RenderTexture, InputTexture);
    }

    // Update is called once per frame
    void Update()
    {
        if (DoRender)
        {
            StartCoroutine(_corout());
            DoRender = false;

        }
    }
}
