Shader "Unlit/shader450shader3d"
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
			float3 cols[3];


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
				p.xy = mul(p.xy,r2d(0.2135497*10.));
p.xz = mul(p.xz,r2d(0.2135497*3.));
acc = _min(acc, float2(_cucube(p-float3(-1.904989, 0.2386253, 7.2874), float3(0.2135497,0.2135497,0.2135497), float3(0.01,0.01,0.01)), 2));
p.xy = mul(p.xy,r2d(-0.04921458*10.));
p.xz = mul(p.xz,r2d(-0.04921458*3.));
acc = _min(acc, float2(_cucube(p-float3(0.2421944, -1.842903, 2.973439), float3(-0.04921458,-0.04921458,-0.04921458), float3(0.01,0.01,0.01)), 0));
p.xy = mul(p.xy,r2d(0.6073208*10.));
p.xz = mul(p.xz,r2d(0.6073208*3.));
acc = _min(acc, float2(_cucube(p-float3(0.284776, -0.6753242, 3.960474), float3(0.6073208,0.6073208,0.6073208), float3(0.01,0.01,0.01)), 0));
p.xy = mul(p.xy,r2d(0.8566242*10.));
p.xz = mul(p.xz,r2d(0.8566242*3.));
acc = _min(acc, float2(_cucube(p-float3(-0.6787994, -0.7459624, 9.537958), float3(0.8566242,0.8566242,0.8566242), float3(0.01,0.01,0.01)), 1));
p.xy = mul(p.xy,r2d(0.8599319*10.));
p.xz = mul(p.xz,r2d(0.8599319*3.));
acc = _min(acc, float2(_cucube(p-float3(-0.8341153, 0.0100596, 5.537039), float3(0.8599319,0.8599319,0.8599319), float3(0.01,0.01,0.01)), 2));
acc = _min(acc, float2(length(p-float3(-0.8903286, -1.805873, 6.695304)) - 0.4367484, 2));
acc = _min(acc, float2(length(p-float3(-0.4470122, -0.3210828, 6.164494)) - 0.6073774, 1));
acc = _min(acc, float2(length(p-float3(-1.58186, -1.703355, 5.590878)) - 0.5462523, 2));
acc = _min(acc, float2(length(p-float3(-1.493769, 1.498184, 8.734189)) - 0.9754707, 0));
p.xy = mul(p.xy,r2d(0.9099903*10.));
p.xz = mul(p.xz,r2d(0.9099903*3.));
acc = _min(acc, float2(_cucube(p-float3(-0.2475631, 1.910504, -0.5117459), float3(0.9099903,0.9099903,0.9099903), float3(0.01,0.01,0.01)), 1));
acc = _min(acc, float2(length(p-float3(0.307524, 0.846476, -0.6768785)) - 0.6823689, 1));
acc = _min(acc, float2(length(p-float3(-1.658434, -1.434106, 5.067102)) - 0.6019553, 0));
acc = _min(acc, float2(length(p-float3(1.871317, -0.01016688, 5.371434)) - -0.05233299, 2));
acc = _min(acc, float2(length(p-float3(-1.474483, -1.978221, 6.152346)) - 0.3473242, 2));
acc = _min(acc, float2(length(p-float3(-0.3970859, -0.574795, 6.475606)) - 0.5819598, 1));
p.xy = mul(p.xy,r2d(0.594732*10.));
p.xz = mul(p.xz,r2d(0.594732*3.));
acc = _min(acc, float2(_cucube(p-float3(1.615716, 0.6491799, 0.5134802), float3(0.594732,0.594732,0.594732), float3(0.01,0.01,0.01)), 1));
acc = _min(acc, float2(length(p-float3(-1.033608, 0.6631183, 6.331053)) - 0.3369823, 2));
acc = _min(acc, float2(length(p-float3(0.1852396, 1.755342, 9.601338)) - 0.5596442, 1));
p.xy = mul(p.xy,r2d(0.3368037*10.));
p.xz = mul(p.xz,r2d(0.3368037*3.));
acc = _min(acc, float2(_cucube(p-float3(0.5446576, -0.9715188, 8.854975), float3(0.3368037,0.3368037,0.3368037), float3(0.01,0.01,0.01)), 2));
p.xy = mul(p.xy,r2d(0.7091351*10.));
p.xz = mul(p.xz,r2d(0.7091351*3.));
acc = _min(acc, float2(_cucube(p-float3(-0.2883918, 0.151314, -0.5412874), float3(0.7091351,0.7091351,0.7091351), float3(0.01,0.01,0.01)), 1));
acc = _min(acc, float2(length(p-float3(0.7449936, -0.07123017, 7.723086)) - 0.0996788, 1));
acc = _min(acc, float2(length(p-float3(-1.186567, 1.102591, 9.236983)) - 0.1551191, 2));
p.xy = mul(p.xy,r2d(-0.05301893*10.));
p.xz = mul(p.xz,r2d(-0.05301893*3.));
acc = _min(acc, float2(_cucube(p-float3(-1.365307, -0.1645005, 4.28892), float3(-0.05301893,-0.05301893,-0.05301893), float3(0.01,0.01,0.01)), 1));
p.xy = mul(p.xy,r2d(0.6568287*10.));
p.xz = mul(p.xz,r2d(0.6568287*3.));
acc = _min(acc, float2(_cucube(p-float3(1.959922, 1.010479, 1.557172), float3(0.6568287,0.6568287,0.6568287), float3(0.01,0.01,0.01)), 0));
acc = _min(acc, float2(length(p-float3(-1.956268, 1.290891, 4.446622)) - 0.2340932, 0));


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
				uv = mul(uv, r2d(-0.5857971));
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
				cols[0] = float3(0.7803922, 0, 0.2235294);
cols[1] = float3(1, 0.3411765, 0.2);
cols[2] = float3(1, 0.764706, 0);
float3 res = trace(ro, rd, 256);
float d = 1000.;
if (res.y > 0.)
{
d = res.y;
	float3 p = ro + rd * res.y;
	float3 n = getNorm(p, res.x);

	col = n * .5 + .5;
	float3 refl = normalize(reflect(rd, n));
	float2 uv360 = float2(atan2(rd.z, rd.x)/PI, acos(rd.y)/PI-.5);
	col = cols[res.z]*(tex2D(myTexture, uv360).xyz+.2);
}
col = lerp(col, float3(0.3411765, 0.09411766, 0.2705882)*pow(1.-saturate(abs(uv.y)),2.0), 1.0-saturate(exp(-d*0.2)));
col += accCol;
col = col.yzx;
col *= 1.-saturate(lenny(uv*0.7520555));
col +=pow(float3(0.3411765, 0.09411766, 0.2705882), float3(2.,2.,2.))* (1.-saturate(lenny(uv*.5)));


				

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
