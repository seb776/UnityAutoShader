using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class ShaderGen3D : AShaderGen
{
    public ColorPalette[] Palettes;
    public RenderTexture RenderTexture;
    public Texture InputTexture;
    // Start is called before the first frame update
    void Start()
    {
        _templateCode = File.ReadAllText("Assets/TemplateShader3D.shader");
    }

    string _templateCode;

    public override void GenerateShaderCode(string outputPath, string shaderName)
    {
        var palette = Palettes[UnityEngine.Random.Range(0, Palettes.Length)];

        StringBuilder sbColors = new StringBuilder();
        sbColors.AppendLine($"float3 cols[{palette.Shapes.Length}];");

        StringBuilder sbMap = new StringBuilder();

        for (int i = 0; i < 25; ++i)
        {
            Vector3 randP = new Vector3(UnityEngine.Random.Range(-2.0f, 2.0f), UnityEngine.Random.Range(-2.0f, 2.0f), UnityEngine.Random.Range(-2.0f, 10.0f));
            float sz = UnityEngine.Random.Range(-0.1f, 1.0f);
            if (UnityEngine.Random.Range(0.0f, 1.0f) < 0.5f)
                sbMap.AppendLine($"acc = _min(acc, float2(length(p-float3({randP.x}, {randP.y}, {randP.z})) - {sz}, {UnityEngine.Random.Range(0, palette.Shapes.Length)}));");
            else
            {
                sbMap.AppendLine($"p.xy = mul(p.xy,r2d({sz}*10.));");
                sbMap.AppendLine($"p.xz = mul(p.xz,r2d({sz}*3.));");
                sbMap.AppendLine($"acc = _min(acc, float2(_cucube(p-float3({randP.x}, {randP.y}, {randP.z}), float3({sz},{sz},{sz}), float3(0.01,0.01,0.01)), {UnityEngine.Random.Range(0, palette.Shapes.Length)}));");
            }

        }


        StringBuilder sbRender = new StringBuilder();
        for (int i = 0; i < palette.Shapes.Length; ++i)
            sbRender.AppendLine($"cols[{i}] = float3({palette.Shapes[i].r}, {palette.Shapes[i].g}, {palette.Shapes[i].b});");
        sbRender.AppendLine("float3 res = trace(ro, rd, 256);");
        sbRender.AppendLine("float d = 1000.;");
        sbRender.AppendLine("if (res.y > 0.)");
        sbRender.AppendLine("{");
        sbRender.AppendLine("d = res.y;");
        sbRender.AppendLine("	float3 p = ro + rd * res.y;");
        sbRender.AppendLine("	float3 n = getNorm(p, res.x);");


        sbRender.AppendLine("");
        sbRender.AppendLine("	col = n * .5 + .5;");
        sbRender.AppendLine("	float3 refl = normalize(reflect(rd, n));");
        sbRender.AppendLine("	float2 uv360 = float2(atan2(rd.z, rd.x)/PI, acos(rd.y)/PI-.5);");

        sbRender.AppendLine($"	col = cols[res.z]*(tex2D(myTexture, uv360).xyz+.2);");
        sbRender.AppendLine("}");
        //col = ;

        sbRender.AppendLine($"col = lerp(col, float3({palette.Back.r}, {palette.Back.g}, {palette.Back.b})*pow(1.-saturate(abs(uv.y)),2.0), 1.0-saturate(exp(-d*0.2)));");
        sbRender.AppendLine("col += accCol;");

        if (UnityEngine.Random.Range(0.0f, 1.0f) < 0.5f)
        {
            sbRender.AppendLine("col = col.zxy;");
        }
        if (UnityEngine.Random.Range(0.0f, 1.0f) < 0.5f)
        {
            sbRender.AppendLine("col = col.yzx;");
        }
        float mul = UnityEngine.Random.Range(0.7f, 1.2f);
        if (UnityEngine.Random.Range(0.0f, 1.0f) < 0.5f)
            sbRender.AppendLine($"col *= 1.-saturate(length(uv*{mul}));");
        else
            sbRender.AppendLine($"col *= 1.-saturate(lenny(uv*{mul}));");

        sbRender.AppendLine($"col +=pow(float3({palette.Back.r}, {palette.Back.g}, {palette.Back.b}), float3(2.,2.,2.))* (1.-saturate(lenny(uv*.5)));");

        var newText = _templateCode
        .Replace("{0}", shaderName)
        .Replace("{1}", sbMap.ToString())
        .Replace("{2}", sbRender.ToString())
        .Replace("{3}", sbColors.ToString())
        .Replace("{4}", $"uv = mul(uv, r2d({UnityEngine.Random.Range(-3.14f, 3.14f)}));");
        //var shaderCode = string.Format(_templateCode, shaderName, addedCode);
        File.WriteAllText(outputPath, newText);
    }


    // Update is called once per frame
    void Update()
    {
        if (DoRender)
        {
            for (int i = 0; i < 1500; ++i)
            {
                Render($"shader{i}", "shader3d", @"E:\OneDrive\Projects\Perso\Shaders\Records\Botz0rg_28_11_2021_2\", RenderTexture, InputTexture);
            }
            DoRender = false;
        }
    }
}
