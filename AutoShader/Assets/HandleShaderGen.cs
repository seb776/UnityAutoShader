using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

[Serializable]
public class ColorPalette
{
    public Color Back;
    public Color[] Shapes;
}

public abstract class AShaderGen : MonoBehaviour
{
    public abstract void GenerateShaderCode(string outputPath, string shaderName);

    public void Render(string name, string shaderfolder, string output, RenderTexture renderTo, Texture inputTex)
    {
        var shaderName = name+shaderfolder;
        var shaderFolderPath = $"Assets/NewShaders/{shaderfolder}";
        try
        {
            if (Directory.Exists(shaderFolderPath))
                Directory.Delete(shaderFolderPath, true);
            Directory.CreateDirectory(shaderFolderPath);
        }
        catch (Exception) { }
        var assetShaderPath = $"{shaderFolderPath}/{shaderName}.shader";
        GenerateShaderCode(assetShaderPath, shaderName);
        UnityEditor.AssetDatabase.ImportAsset(assetShaderPath);
        var shader = Shader.Find($"Unlit/{shaderName}");
        var material = new Material(shader);
        material.SetVector("iSize", new Vector2(renderTo.width, renderTo.height));
        material.SetTexture("myTexture", inputTex);
        Graphics.Blit(null, renderTo, material);

        if (!Directory.Exists(output))
            Directory.CreateDirectory(output);
        SaveTexture($@"{output}\{shaderName}.png", renderTo);

        DestroyImmediate(material);
        DestroyImmediate(shader);
    }

    public void SaveTexture(string path, RenderTexture rt)
    {
        var tex = toTexture2D(rt);
        byte[] bytes = tex.EncodeToPNG();

        System.IO.File.WriteAllBytes(path, bytes);

        DestroyImmediate(tex);
    }
    Texture2D toTexture2D(RenderTexture rTex)
    {
        Texture2D tex = new Texture2D(rTex.width, rTex.height, TextureFormat.RGB24, false);
        RenderTexture.active = rTex;
        tex.ReadPixels(new Rect(0, 0, rTex.width, rTex.height), 0, 0);
        tex.Apply();
        return tex;
    }

    public bool DoRender;
}

public class HandleShaderGen : AShaderGen
{
    public ColorPalette[] Palettes;
    public RenderTexture RenderTexture;
    // Start is called before the first frame update
    void Start()
    {
        _templateCode = File.ReadAllText("Assets/TemplateShader.shader");
    }

    string _templateCode;

    public override void GenerateShaderCode(string outputPath, string shaderName)
    {
        StringBuilder sb = new StringBuilder();
        var palette = Palettes[UnityEngine.Random.Range(0, Palettes.Length)];


        sb.AppendLine("float shp = 400.;");
        sb.AppendLine($"col = float3({palette.Back.r}, {palette.Back.g}, {palette.Back.b});");
        sb.AppendLine("float3 rgb;");
        sb.AppendLine("float shape;");
        sb.AppendLine($"float rep = {UnityEngine.Random.Range(0.01f, 0.07f)};");

        if (UnityEngine.Random.Range(0.0f,1.0f) < 0.5f)
            sb.AppendLine($"float border = _sqr(mul(fmod(uv+rep*0.5, float2(rep, rep))-rep*0.5, r2d({UnityEngine.Random.Range(-5.0f, 5.0f)})), float2({UnityEngine.Random.Range(1.0f, 2.0f)}, rep*{UnityEngine.Random.Range(0.15f, 0.4f)}));");
        else
            sb.AppendLine($"float border = _sqr(mul(uv, r2d({UnityEngine.Random.Range(-5.0f, 5.0f)})), float2({UnityEngine.Random.Range(1.0f,2.0f)}, {UnityEngine.Random.Range(0.15f,0.4f)}));");

        for (int i = 0; i < 15; ++i)
        {
            var colShape = palette.Shapes[UnityEngine.Random.Range(0, palette.Shapes.Length)];
            sb.AppendLine($"rgb = float3({colShape.r}, {colShape.g}, {colShape.b});");

            string shaderFunc = (UnityEngine.Random.Range(0.0f, 1.0f) > 0.5f ? "_cir" : "_loz");
            string pos = $"float2({UnityEngine.Random.Range(-1.0f, 1.0f)}, {UnityEngine.Random.Range(-1.0f, 1.0f)})";
            sb.AppendLine($"shape = {shaderFunc}(uv+{pos}, {UnityEngine.Random.Range(0.1f, 0.5f)});");
            sb.AppendLine($"shape = max(shape, border);");
            sb.AppendLine("col = lerp(col, rgb, 1.-sat(shape*shp));");
        }

        string[] colMap = {
            "col = col.zyx;",
            "col = col.zxy;",
            "col = col.yzx;",
        };

        if (UnityEngine.Random.Range(0.0f,1.0f) < 0.5f)
        {
            sb.AppendLine("col = 1.0-col;");
        }


        var newText = _templateCode.Replace("{0}", shaderName).Replace("{1}", sb.ToString());
        //var shaderCode = string.Format(_templateCode, shaderName, addedCode);
        File.WriteAllText(outputPath, newText);
    }


    // Update is called once per frame
    void Update()
    {
        if (DoRender)
        {
            for (int i = 0; i < 100; ++i)
            {
                Render($"shader{i}", "flat2d", @"E:\OneDrive\Projects\Perso\Shaders\Records\Botz0rg_test\", RenderTexture, null);
            }
            DoRender = false;
        }
    }
}
