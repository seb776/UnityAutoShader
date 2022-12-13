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
public class FloatComparer : IComparer<float>
{
    public int Compare(float x, float y)
    {
        if (x < y)
            return -1;
        else
            return 1;
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
    public RenderTexture DiffRenderTexture;
    public Material DiffMaterial;
    public Texture InputTexture;
    private string _shaderName;
    public Material _material;
    public RenderTexture BrightnessRenderTexture;
    public Material ComputeBrightnessMat;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Start");
        _templateCode = File.ReadAllText("Assets/MetaShadHeur/TemplateMetaShadHeur.shader");
        _templateCode = _templateCode.Replace("{", "{{").Replace("}", "}}")
            .Replace("[0]", "{0}")
            .Replace("[1]", "{1}")
            .Replace("[2]", "{2}");

        _shaderName = "METASHADHEUR/shader";
        var assetShaderPath = $"Assets/NewShaders/METASHADHEUR/metashader.shader";
        _samples = _generateInitialState();

        GenerateShaderCode(assetShaderPath, _shaderName);

        UnityEditor.AssetDatabase.ImportAsset(assetShaderPath);
        var shader = UnityEditor.AssetDatabase.LoadAssetAtPath<Shader>(assetShaderPath);
        _material = new Material(shader);
        _material.SetVector("iSize", new Vector2(RenderTexture.width, RenderTexture.height));
        ////_material.SetTexture("myTexture", inputTex);
        //Graphics.Blit(null, renderTo, _material);

        //if (!Directory.Exists(output))
        //    Directory.CreateDirectory(output);
        //SaveTexture($@"{output}\{shaderName}.png", renderTo);

        //DestroyImmediate(_material);
        //DestroyImmediate(shader);
    }

    string _templateCode;
    IList<Sample> _samples;

    public override void GenerateShaderCode(string outputPath, string shaderName)
    {

        StringBuilder sbMap = new StringBuilder(_samples.Count * 500);

        for (int i = 0; i < _samples.Count; ++i)
        {
            var pos = _samples[i].Position;
            var position = $"p-_Positions[{i}].xyz";
            sbMap.AppendLine($"acc = _min(acc, float2(length({position}) - _Sizes[{i}], {i}.));");
            //            sbMap.AppendLine($"acc = _min(acc, float2(length({position}), {i}.));");
        }


        var newText = String.Format(_templateCode, shaderName, sbMap.ToString());
        //var newText = _templateCode
        //.Replace("{0}", shaderName)
        //.Replace("{1}", sbMap.ToString())
        //.Replace("{2}", sbRender.ToString());

        File.WriteAllText(outputPath, newText);
    }

    private List<Sample> _generateInitialState()
    {
        var samples = new List<Sample>();
        for (int j = 0; j < 128; ++j)
        {
            var sample = new Sample();
            sample.Size = UnityEngine.Random.Range(0.1f, 2.0f);
            float posLim = 5.0f;
            sample.Position.x = UnityEngine.Random.Range(-posLim, posLim);
            sample.Position.y = UnityEngine.Random.Range(-posLim, posLim);
            sample.Position.z = UnityEngine.Random.Range(0.0f, posLim / 2.0f);

            sample.Color.x = UnityEngine.Random.Range(0.0f, 1.0f);
            sample.Color.y = UnityEngine.Random.Range(0.0f, 1.0f);
            sample.Color.z = UnityEngine.Random.Range(0.0f, 1.0f);

            //float c = UnityEngine.Random.Range(0, 2);
            //sample.Color.x = c;
            //sample.Color.y = c;
            //sample.Color.z = c;

            var col = ((Texture2D)CompareImage).GetPixel(UnityEngine.Random.RandomRange(0, ((Texture2D)CompareImage).width), UnityEngine.Random.RandomRange(0, ((Texture2D)CompareImage).height));
            sample.Color.x = col.r;
            sample.Color.y = col.g;
            sample.Color.z = col.b;
            samples.Add(sample);
        }
        return samples;
    }
    private IList<Sample> _mutate(IList<Sample> samples)
    {
        samples = samples.Clone();
        int changes = 1;// (int)((float)samples.Count *(5.0f/100.0f));
        for (int i = 0; i < changes; ++i)
        {
            var sample = samples[UnityEngine.Random.Range(0, samples.Count)];
            var propertyChange = UnityEngine.Random.Range(0, 3);
            if (propertyChange == 0)
            {
                float c = UnityEngine.Random.Range(0, 2);
                sample.Color.x = c;
                sample.Color.y = c;
                sample.Color.z = c;

                sample.Color.x = UnityEngine.Random.Range(0.0f, 1.0f);
                sample.Color.y = UnityEngine.Random.Range(0.0f, 1.0f);
                sample.Color.z = UnityEngine.Random.Range(0.0f, 1.0f);

                var col = ((Texture2D)CompareImage).GetPixel(UnityEngine.Random.RandomRange(0, ((Texture2D)CompareImage).width), UnityEngine.Random.RandomRange(0, ((Texture2D)CompareImage).height));
                sample.Color.x = col.r;
                sample.Color.y = col.g;
                sample.Color.z = col.b;

                //sample.Color.x = Mathf.Lerp(sample.Color.x, UnityEngine.Random.Range(0.0f, 1.0f), 0.25f);
                //sample.Color.y = Mathf.Lerp(sample.Color.y, UnityEngine.Random.Range(0.0f, 1.0f), 0.25f);
                //sample.Color.z = Mathf.Lerp(sample.Color.z, UnityEngine.Random.Range(0.0f, 1.0f), 0.25f);
            }
            if (propertyChange == 1)
            {
                float posLim = 5.0f;


                sample.Position.x = UnityEngine.Random.Range(-posLim, posLim);
                sample.Position.y = UnityEngine.Random.Range(-posLim, posLim);
                sample.Position.z = UnityEngine.Random.Range(0.0f, posLim / 2.0f);
            }
            if (propertyChange == 2)
                sample.Size = UnityEngine.Random.Range(0.1f, 2.0f);// Mathf.Lerp(sample.Size, , 0.5f);
        }
        return samples;
    }

    private float _measureEnergy(IList<Sample> individual, bool savePicture = false)
    {
        // ========== Do render
        _material.SetVector("iSize", new Vector2(RenderTexture.width, RenderTexture.height));
        _material.SetVectorArray("_Colors", individual.Select(el => new Vector4(el.Color.x, el.Color.y, el.Color.z, 1.0f)).ToArray());
        _material.SetVectorArray("_Positions", individual.Select(el => new Vector4(el.Position.x, el.Position.y, el.Position.z, 1.0f)).ToArray());
        _material.SetFloatArray("_Sizes", individual.Select(el => el.Size).ToArray());
        //_material.SetTexture("myTexture", inputTex);
        Graphics.Blit(null, RenderTexture, _material);
        if (savePicture)
        {
            var output = @"C:\TMPImages\";
            if (!Directory.Exists(output))
                Directory.CreateDirectory(output);
            var outputImgPath = $@"{output}\shader.png";
            SaveTexture(outputImgPath, RenderTexture);
        }
        //DestroyImmediate(_material);
        //DestroyImmediate(shader);

        // ========== Then diff
        DiffMaterial.SetTexture("_MainTex", (Texture)CompareImage);
        DiffMaterial.SetTexture("_SecondTex", this.RenderTexture);
        Graphics.Blit(null, DiffRenderTexture, DiffMaterial);
        ComputeBrightnessMat.SetTexture("_MainTex", this.DiffRenderTexture);
        Graphics.Blit(null, BrightnessRenderTexture, ComputeBrightnessMat);
        RenderTexture.active = this.BrightnessRenderTexture;
        Texture2D myTexture2D = new Texture2D(1, 1);
        myTexture2D.ReadPixels(new Rect(0, 0, 1, 1), 0, 0);
        //myTexture2D.Apply();
        RenderTexture.active = this.BrightnessRenderTexture;

        Color[] colors = myTexture2D.GetPixels();
        float LightLevel = 0.0f;
        for (int j = 0; j < colors.Length; j += 4)
        {
            LightLevel += Mathf.Max(Mathf.Max(colors[j].r, colors[j].g), colors[j].b);
            //            LightLevel += (0.2126f * colors[j].r) + (0.7152f * colors[j].g) + (0.0722f * colors[j].b);
        }
        LightLevel /= (float)colors.Length;
        Destroy(myTexture2D); // Check
        return LightLevel;
    }
    IList<Sample> _crossOver(IList<Sample> parentA, IList<Sample> parentB, int crossPoint, bool first)
    {
        if (first)
            return parentA.Select((el, i) => (i < crossPoint ? (Sample)el.Clone() : (Sample)parentB[i].Clone())).ToList();
        return parentA.Select((el, i) => (i > crossPoint ? (Sample)el.Clone() : (Sample)parentB[i].Clone())).ToList();
    }

    IEnumerator _coroutSimulatedGeneticAlgorithm()
    {
        List<IList<Sample>> population = new List<IList<Sample>>();
        int populationSize = 200;
        float bestEnergy = 100000.0f;
        IList<Sample> bestSolution = null;
        for (int i = 0; i < populationSize; ++i)
        {
            population.Add(_generateInitialState());
        }


        for (int iGen = 0; ; ++iGen)
        {
            if (bestSolution != null)
            {
                var energy = _measureEnergy(bestSolution, true);
                Debug.Log($"Best is {energy} gen{iGen}");
            }
            SortedList<float, IList<Sample>> sortedByFit = new SortedList<float, IList<Sample>>(new FloatComparer());
            // We sort individuals based on their fitness
            foreach (var individual in population)
            {
                float energy = _measureEnergy(individual);
                if (energy < bestEnergy)
                {
                    bestSolution = individual;
                    bestEnergy = energy;
                }
                sortedByFit.Add(energy, individual);
                yield return new WaitForEndOfFrame();
            }
            List<IList<Sample>> nextPopulation = new List<IList<Sample>>();

            // We generated the new population
            float coefCrossOver = 0.6f; // Chanced of cross over => the rest is mutation
            float coefGoodSamples = 0.7f;
            float coefBadSamples = 0.0f;// Chances of getting a random individual (including non elite)

            for (int iNew = 0; iNew < populationSize/2; ++iNew)
            {
                IList<Sample> newIndividual = null;// = new List<Sample>();
                int maxIdx = Mathf.RoundToInt(coefGoodSamples * populationSize);
                //if (UnityEngine.Random.Range(0.0f, 1.0f) < coefBadSamples)
                //    maxIdx = populationSize;
                //if (UnityEngine.Random.Range(0.0f, 1.0f) < coefCrossOver)
                {

                    var parentA = population[UnityEngine.Random.Range(0, maxIdx)];
                    var parentB = population[UnityEngine.Random.Range(0, maxIdx)];
                    int crossPoint = UnityEngine.Random.Range(0, parentA.Count);
                    nextPopulation.Add(_crossOver(parentA, parentB, crossPoint, true));
                    nextPopulation.Add(_crossOver(parentA, parentB, crossPoint, false));

                }
            }
            float mutationProbability = 0.1f;
            for (int iIndiv = 0; iIndiv < nextPopulation.Count; ++iIndiv)
            {
                if (UnityEngine.Random.Range(0.0f, 1.0f) < mutationProbability)
                    nextPopulation[iIndiv] = _mutate(nextPopulation[iIndiv]);
            }
            population = nextPopulation;
            yield return new WaitForEndOfFrame();
        }
    }
    IEnumerator _coroutSimulatedAnnealing()
    {
        float temperature = 2.0f;
        IList<Sample> bestSolution = _samples;
        float bestEnergy = 100.0f;
        for (int i = 0; bestEnergy > 0.01f; ++i)
        {
            _samples = _mutate(bestSolution);
            temperature *= 0.99f;

            //Render($"shader{i}", "METASHADHEUR", @"C:\TMPImages\", RenderTexture, InputTexture, i == 0);
            // =============================================
            _material.SetVector("iSize", new Vector2(RenderTexture.width, RenderTexture.height));
            _material.SetVectorArray("_Colors", _samples.Select(el => new Vector4(el.Color.x, el.Color.y, el.Color.z, 1.0f)).ToArray());
            _material.SetVectorArray("_Positions", _samples.Select(el => new Vector4(el.Position.x, el.Position.y, el.Position.z, 1.0f)).ToArray());
            _material.SetFloatArray("_Sizes", _samples.Select(el => el.Size).ToArray());
            //_material.SetTexture("myTexture", inputTex);
            Graphics.Blit(null, RenderTexture, _material);
            var output = @"C:\TMPImages\";
            if (!Directory.Exists(output))
                Directory.CreateDirectory(output);
            var outputImgPath = $@"{output}\shader{i}METASHADHEUR.png";
            //DestroyImmediate(_material);
            //DestroyImmediate(shader);
            // =============================================

            float curEnergy = _measureEnergy(_samples); // TODO might need to fix it
            if (i % 200 == 0)
            {
                SaveTexture(outputImgPath, RenderTexture);
                Debug.Log($"Cur energy {curEnergy} best:{bestEnergy} temp:{temperature}");
            }

            float deltaEnergy = curEnergy - bestEnergy;
            if (deltaEnergy < 0.0f)// || (deltaEnergy > 0.01f && UnityEngine.Random.Range(0.0f,1.0f) < Mathf.Exp(-deltaEnergy/temperature)))
            {
                bestEnergy = curEnergy;
                bestSolution = _samples;

                //_material.SetVector("iSize", new Vector2(RenderTexture.width, RenderTexture.height));
                //_material.SetVectorArray("_Colors", _samples.Select(el => new Vector4(el.Color.x, el.Color.y, el.Color.z, 1.0f)).ToArray());
                //_material.SetVectorArray("_Positions", _samples.Select(el => new Vector4(el.Position.x, el.Position.y, el.Position.z, 1.0f)).ToArray());
                //_material.SetFloatArray("_Sizes", _samples.Select(el => el.Size).ToArray());
                ////_material.SetTexture("myTexture", inputTex);
                //Graphics.Blit(null, RenderTexture, _material);
                //if (!Directory.Exists(output))
                //    Directory.CreateDirectory(output);
                //SaveTexture($@"{output}\shaderFinalMETASHADHEUR.png", RenderTexture);
            }
            if (i % 5 == 0)
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
            StartCoroutine(_coroutSimulatedGeneticAlgorithm());
            DoRender = false;

        }
    }
}
