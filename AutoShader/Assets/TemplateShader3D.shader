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
			sampler2D myTexture;

			float2 iSize;
			{3}

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
#define PI 3.14159265
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

			float2 _min(float2 a, float2 b)
			{
				if (a.x < b.x)
					return a;
				return b;
			}

			float _cucube(float3 p, float3 s, float3 th)
			{
				float3 l = abs(p) - s;
				float cube = max(max(l.x, l.y), l.z);
				l = abs(l) - th;
				float x = max(l.y, l.z);
				float y = max(l.x, l.z);
				float z = max(l.x, l.y);

				return max(min(min(x, y), z), cube);
			}

			float2 map(float3 p)
			{
				float2 acc = float2(10000., -1.);

				//acc = _min(acc, float2(length(p) - 1.0, 0.));
				{1}

				return acc;
			}

			float3 getCam(float3 rd, float2 uv)
			{
				float3 r = normalize(cross(rd, float3(0., 1., 0.)));
				float3 u = normalize(cross(rd, r));
				return normalize(rd + (r*uv.x+u*uv.y));
			}
			float3 getNorm(float3 p, float d)
			{
				float2 e = float2(0.01, 0.);
				return normalize(float3(d, d, d) - float3(map(p - e.xyy).x, map(p - e.yxy).x, map(p - e.yyx).x));
			}
			float3 accCol;
			float3 trace(float3 ro, float3 rd, int steps)
			{
				accCol = float3(0.0, 0.0, 0.0);
				float3 p = ro;
				for (int i = 0; i < steps; ++i)
				{
					float2 res = map(p);
					if (res.x < 0.01)
						return float3(res.x, distance(p, ro), res.y);
					accCol += cols[int(res.y)] * (1. - saturate(res.x/0.25))*0.015 * saturate(length(p) / 3.0);
					p += rd * res.x*0.1;
				}
				return float3(-1., -1., -1.);
			}

			float3 rdr(float2 uv)
			{
				{4}
				float3 col = float3(0., 0., 0.);
				
				float3 ro = float3(0., -1., -5.);
				float3 ta = float3(0., 0., 0.);
				float3 rd = normalize(ta-ro);
				
				rd = getCam(rd, uv);

				//float3 res = trace(ro, rd, 128);
				//if (res.y > 0.)
				//{
				//	float3 p = ro + rd * res.y;
				//	float3 n = getNorm(p, res.x);

				//	col = n * .5 + .5;
				//}
				{2}

				

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
