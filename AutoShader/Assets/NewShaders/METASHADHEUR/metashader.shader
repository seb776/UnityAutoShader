Shader "Unlit/METASHADHEUR/shader"
{
    Properties {
			_Sharpness("Sharpness", Float) = 1.0
	}
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
#define SAMPLES_COUNT 128
			float _Sizes[SAMPLES_COUNT];
			float4 _Positions[SAMPLES_COUNT];
			float4 _Colors[SAMPLES_COUNT];
			float _Sharpness;

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
acc = _min(acc, float2(length(p-_Positions[42].xyz) - _Sizes[42], 42.));
acc = _min(acc, float2(length(p-_Positions[43].xyz) - _Sizes[43], 43.));
acc = _min(acc, float2(length(p-_Positions[44].xyz) - _Sizes[44], 44.));
acc = _min(acc, float2(length(p-_Positions[45].xyz) - _Sizes[45], 45.));
acc = _min(acc, float2(length(p-_Positions[46].xyz) - _Sizes[46], 46.));
acc = _min(acc, float2(length(p-_Positions[47].xyz) - _Sizes[47], 47.));
acc = _min(acc, float2(length(p-_Positions[48].xyz) - _Sizes[48], 48.));
acc = _min(acc, float2(length(p-_Positions[49].xyz) - _Sizes[49], 49.));
acc = _min(acc, float2(length(p-_Positions[50].xyz) - _Sizes[50], 50.));
acc = _min(acc, float2(length(p-_Positions[51].xyz) - _Sizes[51], 51.));
acc = _min(acc, float2(length(p-_Positions[52].xyz) - _Sizes[52], 52.));
acc = _min(acc, float2(length(p-_Positions[53].xyz) - _Sizes[53], 53.));
acc = _min(acc, float2(length(p-_Positions[54].xyz) - _Sizes[54], 54.));
acc = _min(acc, float2(length(p-_Positions[55].xyz) - _Sizes[55], 55.));
acc = _min(acc, float2(length(p-_Positions[56].xyz) - _Sizes[56], 56.));
acc = _min(acc, float2(length(p-_Positions[57].xyz) - _Sizes[57], 57.));
acc = _min(acc, float2(length(p-_Positions[58].xyz) - _Sizes[58], 58.));
acc = _min(acc, float2(length(p-_Positions[59].xyz) - _Sizes[59], 59.));
acc = _min(acc, float2(length(p-_Positions[60].xyz) - _Sizes[60], 60.));
acc = _min(acc, float2(length(p-_Positions[61].xyz) - _Sizes[61], 61.));
acc = _min(acc, float2(length(p-_Positions[62].xyz) - _Sizes[62], 62.));
acc = _min(acc, float2(length(p-_Positions[63].xyz) - _Sizes[63], 63.));
acc = _min(acc, float2(length(p-_Positions[64].xyz) - _Sizes[64], 64.));
acc = _min(acc, float2(length(p-_Positions[65].xyz) - _Sizes[65], 65.));
acc = _min(acc, float2(length(p-_Positions[66].xyz) - _Sizes[66], 66.));
acc = _min(acc, float2(length(p-_Positions[67].xyz) - _Sizes[67], 67.));
acc = _min(acc, float2(length(p-_Positions[68].xyz) - _Sizes[68], 68.));
acc = _min(acc, float2(length(p-_Positions[69].xyz) - _Sizes[69], 69.));
acc = _min(acc, float2(length(p-_Positions[70].xyz) - _Sizes[70], 70.));
acc = _min(acc, float2(length(p-_Positions[71].xyz) - _Sizes[71], 71.));
acc = _min(acc, float2(length(p-_Positions[72].xyz) - _Sizes[72], 72.));
acc = _min(acc, float2(length(p-_Positions[73].xyz) - _Sizes[73], 73.));
acc = _min(acc, float2(length(p-_Positions[74].xyz) - _Sizes[74], 74.));
acc = _min(acc, float2(length(p-_Positions[75].xyz) - _Sizes[75], 75.));
acc = _min(acc, float2(length(p-_Positions[76].xyz) - _Sizes[76], 76.));
acc = _min(acc, float2(length(p-_Positions[77].xyz) - _Sizes[77], 77.));
acc = _min(acc, float2(length(p-_Positions[78].xyz) - _Sizes[78], 78.));
acc = _min(acc, float2(length(p-_Positions[79].xyz) - _Sizes[79], 79.));
acc = _min(acc, float2(length(p-_Positions[80].xyz) - _Sizes[80], 80.));
acc = _min(acc, float2(length(p-_Positions[81].xyz) - _Sizes[81], 81.));
acc = _min(acc, float2(length(p-_Positions[82].xyz) - _Sizes[82], 82.));
acc = _min(acc, float2(length(p-_Positions[83].xyz) - _Sizes[83], 83.));
acc = _min(acc, float2(length(p-_Positions[84].xyz) - _Sizes[84], 84.));
acc = _min(acc, float2(length(p-_Positions[85].xyz) - _Sizes[85], 85.));
acc = _min(acc, float2(length(p-_Positions[86].xyz) - _Sizes[86], 86.));
acc = _min(acc, float2(length(p-_Positions[87].xyz) - _Sizes[87], 87.));
acc = _min(acc, float2(length(p-_Positions[88].xyz) - _Sizes[88], 88.));
acc = _min(acc, float2(length(p-_Positions[89].xyz) - _Sizes[89], 89.));
acc = _min(acc, float2(length(p-_Positions[90].xyz) - _Sizes[90], 90.));
acc = _min(acc, float2(length(p-_Positions[91].xyz) - _Sizes[91], 91.));
acc = _min(acc, float2(length(p-_Positions[92].xyz) - _Sizes[92], 92.));
acc = _min(acc, float2(length(p-_Positions[93].xyz) - _Sizes[93], 93.));
acc = _min(acc, float2(length(p-_Positions[94].xyz) - _Sizes[94], 94.));
acc = _min(acc, float2(length(p-_Positions[95].xyz) - _Sizes[95], 95.));
acc = _min(acc, float2(length(p-_Positions[96].xyz) - _Sizes[96], 96.));
acc = _min(acc, float2(length(p-_Positions[97].xyz) - _Sizes[97], 97.));
acc = _min(acc, float2(length(p-_Positions[98].xyz) - _Sizes[98], 98.));
acc = _min(acc, float2(length(p-_Positions[99].xyz) - _Sizes[99], 99.));
acc = _min(acc, float2(length(p-_Positions[100].xyz) - _Sizes[100], 100.));
acc = _min(acc, float2(length(p-_Positions[101].xyz) - _Sizes[101], 101.));
acc = _min(acc, float2(length(p-_Positions[102].xyz) - _Sizes[102], 102.));
acc = _min(acc, float2(length(p-_Positions[103].xyz) - _Sizes[103], 103.));
acc = _min(acc, float2(length(p-_Positions[104].xyz) - _Sizes[104], 104.));
acc = _min(acc, float2(length(p-_Positions[105].xyz) - _Sizes[105], 105.));
acc = _min(acc, float2(length(p-_Positions[106].xyz) - _Sizes[106], 106.));
acc = _min(acc, float2(length(p-_Positions[107].xyz) - _Sizes[107], 107.));
acc = _min(acc, float2(length(p-_Positions[108].xyz) - _Sizes[108], 108.));
acc = _min(acc, float2(length(p-_Positions[109].xyz) - _Sizes[109], 109.));
acc = _min(acc, float2(length(p-_Positions[110].xyz) - _Sizes[110], 110.));
acc = _min(acc, float2(length(p-_Positions[111].xyz) - _Sizes[111], 111.));
acc = _min(acc, float2(length(p-_Positions[112].xyz) - _Sizes[112], 112.));
acc = _min(acc, float2(length(p-_Positions[113].xyz) - _Sizes[113], 113.));
acc = _min(acc, float2(length(p-_Positions[114].xyz) - _Sizes[114], 114.));
acc = _min(acc, float2(length(p-_Positions[115].xyz) - _Sizes[115], 115.));
acc = _min(acc, float2(length(p-_Positions[116].xyz) - _Sizes[116], 116.));
acc = _min(acc, float2(length(p-_Positions[117].xyz) - _Sizes[117], 117.));
acc = _min(acc, float2(length(p-_Positions[118].xyz) - _Sizes[118], 118.));
acc = _min(acc, float2(length(p-_Positions[119].xyz) - _Sizes[119], 119.));
acc = _min(acc, float2(length(p-_Positions[120].xyz) - _Sizes[120], 120.));
acc = _min(acc, float2(length(p-_Positions[121].xyz) - _Sizes[121], 121.));
acc = _min(acc, float2(length(p-_Positions[122].xyz) - _Sizes[122], 122.));
acc = _min(acc, float2(length(p-_Positions[123].xyz) - _Sizes[123], 123.));
acc = _min(acc, float2(length(p-_Positions[124].xyz) - _Sizes[124], 124.));
acc = _min(acc, float2(length(p-_Positions[125].xyz) - _Sizes[125], 125.));
acc = _min(acc, float2(length(p-_Positions[126].xyz) - _Sizes[126], 126.));
acc = _min(acc, float2(length(p-_Positions[127].xyz) - _Sizes[127], 127.));


				return acc;
			}

			float3 getCam(float3 rd, float2 uv)
			{
				float3 r = normalize(cross(rd, float3(0., 1., 0.)));
				float3 u = normalize(cross(rd, r));
				return normalize(rd + (r*uv.x+u*uv.y));
			}
			float3 accCol;
			float3 trace(float3 ro, float3 rd, int steps)
			{
				accCol = 0.;
				float3 p = ro;
				for (int i = 0; i < 128 && distance(p, ro) < 20.0f; ++i)
				{
					float2 res = map(p);
					if (res.x < 0.01)
						return float3(res.x, distance(p, ro), res.y);
					accCol = lerp(accCol, _Colors[int(res.y)].xyz, (1.-saturate(_Sharpness*res.x / _Sizes[int(res.y)])));
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
//				col += accCol;
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
