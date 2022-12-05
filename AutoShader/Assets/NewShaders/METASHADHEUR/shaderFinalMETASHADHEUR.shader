Shader "Unlit/shaderFinalMETASHADHEUR"
{
    Properties {}
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
			float2 iSize;
#define SAMPLES_COUNT 42
			float _Sizes[SAMPLES_COUNT];
			float4 _Positions[SAMPLES_COUNT];
			float4 _Colors[SAMPLES_COUNT];


            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
                return o;
            }

			float2 _min(float2 a, float2 b)
			{
				if (a.x < b.x)
					return a;
				return b;
			}

			float2 map(float3 p)
			{
				float2 acc = float2(10000., -1.);

				acc = _min(acc, float2(length(p-_Positions[0].xyz) - _Sizes[0], 0.));
acc = _min(acc, float2(length(p-_Positions[1].xyz) - _Sizes[1], 1.));
acc = _min(acc, float2(length(p-_Positions[2].xyz) - _Sizes[2], 2.));
acc = _min(acc, float2(length(p-_Positions[3].xyz) - _Sizes[3], 3.));
acc = _min(acc, float2(length(p-_Positions[4].xyz) - _Sizes[4], 4.));
acc = _min(acc, float2(length(p-_Positions[5].xyz) - _Sizes[5], 5.));
acc = _min(acc, float2(length(p-_Positions[6].xyz) - _Sizes[6], 6.));
acc = _min(acc, float2(length(p-_Positions[7].xyz) - _Sizes[7], 7.));
acc = _min(acc, float2(length(p-_Positions[8].xyz) - _Sizes[8], 8.));
acc = _min(acc, float2(length(p-_Positions[9].xyz) - _Sizes[9], 9.));
acc = _min(acc, float2(length(p-_Positions[10].xyz) - _Sizes[10], 10.));
acc = _min(acc, float2(length(p-_Positions[11].xyz) - _Sizes[11], 11.));
acc = _min(acc, float2(length(p-_Positions[12].xyz) - _Sizes[12], 12.));
acc = _min(acc, float2(length(p-_Positions[13].xyz) - _Sizes[13], 13.));
acc = _min(acc, float2(length(p-_Positions[14].xyz) - _Sizes[14], 14.));
acc = _min(acc, float2(length(p-_Positions[15].xyz) - _Sizes[15], 15.));
acc = _min(acc, float2(length(p-_Positions[16].xyz) - _Sizes[16], 16.));
acc = _min(acc, float2(length(p-_Positions[17].xyz) - _Sizes[17], 17.));
acc = _min(acc, float2(length(p-_Positions[18].xyz) - _Sizes[18], 18.));
acc = _min(acc, float2(length(p-_Positions[19].xyz) - _Sizes[19], 19.));
acc = _min(acc, float2(length(p-_Positions[20].xyz) - _Sizes[20], 20.));
acc = _min(acc, float2(length(p-_Positions[21].xyz) - _Sizes[21], 21.));
acc = _min(acc, float2(length(p-_Positions[22].xyz) - _Sizes[22], 22.));
acc = _min(acc, float2(length(p-_Positions[23].xyz) - _Sizes[23], 23.));
acc = _min(acc, float2(length(p-_Positions[24].xyz) - _Sizes[24], 24.));
acc = _min(acc, float2(length(p-_Positions[25].xyz) - _Sizes[25], 25.));
acc = _min(acc, float2(length(p-_Positions[26].xyz) - _Sizes[26], 26.));
acc = _min(acc, float2(length(p-_Positions[27].xyz) - _Sizes[27], 27.));
acc = _min(acc, float2(length(p-_Positions[28].xyz) - _Sizes[28], 28.));
acc = _min(acc, float2(length(p-_Positions[29].xyz) - _Sizes[29], 29.));
acc = _min(acc, float2(length(p-_Positions[30].xyz) - _Sizes[30], 30.));
acc = _min(acc, float2(length(p-_Positions[31].xyz) - _Sizes[31], 31.));
acc = _min(acc, float2(length(p-_Positions[32].xyz) - _Sizes[32], 32.));
acc = _min(acc, float2(length(p-_Positions[33].xyz) - _Sizes[33], 33.));
acc = _min(acc, float2(length(p-_Positions[34].xyz) - _Sizes[34], 34.));
acc = _min(acc, float2(length(p-_Positions[35].xyz) - _Sizes[35], 35.));
acc = _min(acc, float2(length(p-_Positions[36].xyz) - _Sizes[36], 36.));
acc = _min(acc, float2(length(p-_Positions[37].xyz) - _Sizes[37], 37.));
acc = _min(acc, float2(length(p-_Positions[38].xyz) - _Sizes[38], 38.));
acc = _min(acc, float2(length(p-_Positions[39].xyz) - _Sizes[39], 39.));
acc = _min(acc, float2(length(p-_Positions[40].xyz) - _Sizes[40], 40.));
acc = _min(acc, float2(length(p-_Positions[41].xyz) - _Sizes[41], 41.));


				return acc;
			}

			float3 getCam(float3 rd, float2 uv)
			{
				float3 r = normalize(cross(rd, float3(0., 1., 0.)));
				float3 u = normalize(cross(rd, r));
				return normalize(rd + (r*uv.x+u*uv.y));
			}

			float3 trace(float3 ro, float3 rd, int steps)
			{
				float3 p = ro;
				for (int i = 0; i < 128 && distance(p, ro) < 20.0f; ++i)
				{
					float2 res = map(p);
					if (res.x < 0.01)
						return float3(res.x, distance(p, ro), res.y);
					p += rd * res.x;
				}
				return float3(-1., -1., -1.);
			}

			float3 rdr(float2 uv)
			{
				float3 col = float3(0., 0., 0.);
				
				float3 ro = float3(0., -1., -5.);
				float3 ta = float3(0., 0., 0.);
				float3 rd = normalize(ta-ro);
				
				rd = getCam(rd, uv);

				float3 res = trace(ro, rd, 128);
				if (res.y > 0.)
				{
					col = _Colors[int(res.z)].xyz;
				}

				return col;
			}

			float3 rdrAA(float2 uv, float2 fragCoord)
			{
				float2 p = (2.0 * fragCoord - iSize.xy) / iSize.y;
				float3 col = rdr(p);
				return col;
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
