Shader "Unlit/{0}"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

			float2 iSize;

			float2x2 r2d(float a) { float c = cos(a), s = sin(a);  return float2x2(c,-s,s,c); }

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }
#define sat(a) clamp(a,0.,1.)
			float lenny(float2 v)
			{
				return abs(v.x) + abs(v.y);
			}

			float _cir(float2 p, float r)
			{
				return length(p) - r;
			}
			float _loz(float2 p, float r)
			{
				return lenny(p) - r;
			}
			float _cirloz(float2 p, float r, float f)
			{
				return lerp(length(p), lenny(p), f) - r;
			}

			float _sqr(float2 p, float2 s)
			{
				float2 q = abs(p) - s;
				return max(q.x, q.y);
			}

			float3 rdr(float2 uv)
			{
				float3 col;
				
				{1}

				return col;
			}

#define AA 6
			float3 rdrAA(float2 uv, float2 fragCoord)
			{
				float3 tot = float3(0.0, 0., 0.);
#if AA>1
				for (int m = 0; m < AA; m++)
					for (int n = 0; n < AA; n++)
					{
						// pixel coordinates
						float2 o = float2(float(m), float(n)) / float(AA) - 0.5;
						float2 p = (2.0*(fragCoord + o) - iSize.xy) / iSize.y;
#else    
				float2 p = (2.0*fragCoord - iSize.xy) / iSize.y;
#endif
				float3 col = rdr(p);
				tot += col;
#if AA>1
					}
			tot /= float(AA*AA);
#endif
			return tot;
			}

            fixed4 frag (v2f i) : SV_Target
            {
				float3 col;
				col = rdrAA(i.uv, i.uv*iSize);
				return float4(col.x, col.y, col.z, 1.0);

				

            }
            ENDCG
        }
    }
}
