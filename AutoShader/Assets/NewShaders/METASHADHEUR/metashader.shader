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

				acc = _min(acc, float2(length(p-float3(-5, -5, _Positions[0].z)), 0.));
acc = _min(acc, float2(length(p-float3(-4.090909, -5, _Positions[1].z)), 1.));
acc = _min(acc, float2(length(p-float3(-3.181818, -5, _Positions[2].z)), 2.));
acc = _min(acc, float2(length(p-float3(-2.272727, -5, _Positions[3].z)), 3.));
acc = _min(acc, float2(length(p-float3(-1.363636, -5, _Positions[4].z)), 4.));
acc = _min(acc, float2(length(p-float3(-0.4545455, -5, _Positions[5].z)), 5.));
acc = _min(acc, float2(length(p-float3(0.4545455, -5, _Positions[6].z)), 6.));
acc = _min(acc, float2(length(p-float3(1.363636, -5, _Positions[7].z)), 7.));
acc = _min(acc, float2(length(p-float3(2.272727, -5, _Positions[8].z)), 8.));
acc = _min(acc, float2(length(p-float3(3.181818, -5, _Positions[9].z)), 9.));
acc = _min(acc, float2(length(p-float3(4.090909, -5, _Positions[10].z)), 10.));
acc = _min(acc, float2(length(p-float3(-5, -4.090909, _Positions[11].z)), 11.));
acc = _min(acc, float2(length(p-float3(-4.090909, -4.090909, _Positions[12].z)), 12.));
acc = _min(acc, float2(length(p-float3(-3.181818, -4.090909, _Positions[13].z)), 13.));
acc = _min(acc, float2(length(p-float3(-2.272727, -4.090909, _Positions[14].z)), 14.));
acc = _min(acc, float2(length(p-float3(-1.363636, -4.090909, _Positions[15].z)), 15.));
acc = _min(acc, float2(length(p-float3(-0.4545455, -4.090909, _Positions[16].z)), 16.));
acc = _min(acc, float2(length(p-float3(0.4545455, -4.090909, _Positions[17].z)), 17.));
acc = _min(acc, float2(length(p-float3(1.363636, -4.090909, _Positions[18].z)), 18.));
acc = _min(acc, float2(length(p-float3(2.272727, -4.090909, _Positions[19].z)), 19.));
acc = _min(acc, float2(length(p-float3(3.181818, -4.090909, _Positions[20].z)), 20.));
acc = _min(acc, float2(length(p-float3(4.090909, -4.090909, _Positions[21].z)), 21.));
acc = _min(acc, float2(length(p-float3(-5, -3.181818, _Positions[22].z)), 22.));
acc = _min(acc, float2(length(p-float3(-4.090909, -3.181818, _Positions[23].z)), 23.));
acc = _min(acc, float2(length(p-float3(-3.181818, -3.181818, _Positions[24].z)), 24.));
acc = _min(acc, float2(length(p-float3(-2.272727, -3.181818, _Positions[25].z)), 25.));
acc = _min(acc, float2(length(p-float3(-1.363636, -3.181818, _Positions[26].z)), 26.));
acc = _min(acc, float2(length(p-float3(-0.4545455, -3.181818, _Positions[27].z)), 27.));
acc = _min(acc, float2(length(p-float3(0.4545455, -3.181818, _Positions[28].z)), 28.));
acc = _min(acc, float2(length(p-float3(1.363636, -3.181818, _Positions[29].z)), 29.));
acc = _min(acc, float2(length(p-float3(2.272727, -3.181818, _Positions[30].z)), 30.));
acc = _min(acc, float2(length(p-float3(3.181818, -3.181818, _Positions[31].z)), 31.));
acc = _min(acc, float2(length(p-float3(4.090909, -3.181818, _Positions[32].z)), 32.));
acc = _min(acc, float2(length(p-float3(-5, -2.272727, _Positions[33].z)), 33.));
acc = _min(acc, float2(length(p-float3(-4.090909, -2.272727, _Positions[34].z)), 34.));
acc = _min(acc, float2(length(p-float3(-3.181818, -2.272727, _Positions[35].z)), 35.));
acc = _min(acc, float2(length(p-float3(-2.272727, -2.272727, _Positions[36].z)), 36.));
acc = _min(acc, float2(length(p-float3(-1.363636, -2.272727, _Positions[37].z)), 37.));
acc = _min(acc, float2(length(p-float3(-0.4545455, -2.272727, _Positions[38].z)), 38.));
acc = _min(acc, float2(length(p-float3(0.4545455, -2.272727, _Positions[39].z)), 39.));
acc = _min(acc, float2(length(p-float3(1.363636, -2.272727, _Positions[40].z)), 40.));
acc = _min(acc, float2(length(p-float3(2.272727, -2.272727, _Positions[41].z)), 41.));
acc = _min(acc, float2(length(p-float3(3.181818, -2.272727, _Positions[42].z)), 42.));
acc = _min(acc, float2(length(p-float3(4.090909, -2.272727, _Positions[43].z)), 43.));
acc = _min(acc, float2(length(p-float3(-5, -1.363636, _Positions[44].z)), 44.));
acc = _min(acc, float2(length(p-float3(-4.090909, -1.363636, _Positions[45].z)), 45.));
acc = _min(acc, float2(length(p-float3(-3.181818, -1.363636, _Positions[46].z)), 46.));
acc = _min(acc, float2(length(p-float3(-2.272727, -1.363636, _Positions[47].z)), 47.));
acc = _min(acc, float2(length(p-float3(-1.363636, -1.363636, _Positions[48].z)), 48.));
acc = _min(acc, float2(length(p-float3(-0.4545455, -1.363636, _Positions[49].z)), 49.));
acc = _min(acc, float2(length(p-float3(0.4545455, -1.363636, _Positions[50].z)), 50.));
acc = _min(acc, float2(length(p-float3(1.363636, -1.363636, _Positions[51].z)), 51.));
acc = _min(acc, float2(length(p-float3(2.272727, -1.363636, _Positions[52].z)), 52.));
acc = _min(acc, float2(length(p-float3(3.181818, -1.363636, _Positions[53].z)), 53.));
acc = _min(acc, float2(length(p-float3(4.090909, -1.363636, _Positions[54].z)), 54.));
acc = _min(acc, float2(length(p-float3(-5, -0.4545455, _Positions[55].z)), 55.));
acc = _min(acc, float2(length(p-float3(-4.090909, -0.4545455, _Positions[56].z)), 56.));
acc = _min(acc, float2(length(p-float3(-3.181818, -0.4545455, _Positions[57].z)), 57.));
acc = _min(acc, float2(length(p-float3(-2.272727, -0.4545455, _Positions[58].z)), 58.));
acc = _min(acc, float2(length(p-float3(-1.363636, -0.4545455, _Positions[59].z)), 59.));
acc = _min(acc, float2(length(p-float3(-0.4545455, -0.4545455, _Positions[60].z)), 60.));
acc = _min(acc, float2(length(p-float3(0.4545455, -0.4545455, _Positions[61].z)), 61.));
acc = _min(acc, float2(length(p-float3(1.363636, -0.4545455, _Positions[62].z)), 62.));
acc = _min(acc, float2(length(p-float3(2.272727, -0.4545455, _Positions[63].z)), 63.));
acc = _min(acc, float2(length(p-float3(3.181818, -0.4545455, _Positions[64].z)), 64.));
acc = _min(acc, float2(length(p-float3(4.090909, -0.4545455, _Positions[65].z)), 65.));
acc = _min(acc, float2(length(p-float3(-5, 0.4545455, _Positions[66].z)), 66.));
acc = _min(acc, float2(length(p-float3(-4.090909, 0.4545455, _Positions[67].z)), 67.));
acc = _min(acc, float2(length(p-float3(-3.181818, 0.4545455, _Positions[68].z)), 68.));
acc = _min(acc, float2(length(p-float3(-2.272727, 0.4545455, _Positions[69].z)), 69.));
acc = _min(acc, float2(length(p-float3(-1.363636, 0.4545455, _Positions[70].z)), 70.));
acc = _min(acc, float2(length(p-float3(-0.4545455, 0.4545455, _Positions[71].z)), 71.));
acc = _min(acc, float2(length(p-float3(0.4545455, 0.4545455, _Positions[72].z)), 72.));
acc = _min(acc, float2(length(p-float3(1.363636, 0.4545455, _Positions[73].z)), 73.));
acc = _min(acc, float2(length(p-float3(2.272727, 0.4545455, _Positions[74].z)), 74.));
acc = _min(acc, float2(length(p-float3(3.181818, 0.4545455, _Positions[75].z)), 75.));
acc = _min(acc, float2(length(p-float3(4.090909, 0.4545455, _Positions[76].z)), 76.));
acc = _min(acc, float2(length(p-float3(-5, 1.363636, _Positions[77].z)), 77.));
acc = _min(acc, float2(length(p-float3(-4.090909, 1.363636, _Positions[78].z)), 78.));
acc = _min(acc, float2(length(p-float3(-3.181818, 1.363636, _Positions[79].z)), 79.));
acc = _min(acc, float2(length(p-float3(-2.272727, 1.363636, _Positions[80].z)), 80.));
acc = _min(acc, float2(length(p-float3(-1.363636, 1.363636, _Positions[81].z)), 81.));
acc = _min(acc, float2(length(p-float3(-0.4545455, 1.363636, _Positions[82].z)), 82.));
acc = _min(acc, float2(length(p-float3(0.4545455, 1.363636, _Positions[83].z)), 83.));
acc = _min(acc, float2(length(p-float3(1.363636, 1.363636, _Positions[84].z)), 84.));
acc = _min(acc, float2(length(p-float3(2.272727, 1.363636, _Positions[85].z)), 85.));
acc = _min(acc, float2(length(p-float3(3.181818, 1.363636, _Positions[86].z)), 86.));
acc = _min(acc, float2(length(p-float3(4.090909, 1.363636, _Positions[87].z)), 87.));
acc = _min(acc, float2(length(p-float3(-5, 2.272727, _Positions[88].z)), 88.));
acc = _min(acc, float2(length(p-float3(-4.090909, 2.272727, _Positions[89].z)), 89.));
acc = _min(acc, float2(length(p-float3(-3.181818, 2.272727, _Positions[90].z)), 90.));
acc = _min(acc, float2(length(p-float3(-2.272727, 2.272727, _Positions[91].z)), 91.));
acc = _min(acc, float2(length(p-float3(-1.363636, 2.272727, _Positions[92].z)), 92.));
acc = _min(acc, float2(length(p-float3(-0.4545455, 2.272727, _Positions[93].z)), 93.));
acc = _min(acc, float2(length(p-float3(0.4545455, 2.272727, _Positions[94].z)), 94.));
acc = _min(acc, float2(length(p-float3(1.363636, 2.272727, _Positions[95].z)), 95.));
acc = _min(acc, float2(length(p-float3(2.272727, 2.272727, _Positions[96].z)), 96.));
acc = _min(acc, float2(length(p-float3(3.181818, 2.272727, _Positions[97].z)), 97.));
acc = _min(acc, float2(length(p-float3(4.090909, 2.272727, _Positions[98].z)), 98.));
acc = _min(acc, float2(length(p-float3(-5, 3.181818, _Positions[99].z)), 99.));
acc = _min(acc, float2(length(p-float3(-4.090909, 3.181818, _Positions[100].z)), 100.));
acc = _min(acc, float2(length(p-float3(-3.181818, 3.181818, _Positions[101].z)), 101.));
acc = _min(acc, float2(length(p-float3(-2.272727, 3.181818, _Positions[102].z)), 102.));
acc = _min(acc, float2(length(p-float3(-1.363636, 3.181818, _Positions[103].z)), 103.));
acc = _min(acc, float2(length(p-float3(-0.4545455, 3.181818, _Positions[104].z)), 104.));
acc = _min(acc, float2(length(p-float3(0.4545455, 3.181818, _Positions[105].z)), 105.));
acc = _min(acc, float2(length(p-float3(1.363636, 3.181818, _Positions[106].z)), 106.));
acc = _min(acc, float2(length(p-float3(2.272727, 3.181818, _Positions[107].z)), 107.));
acc = _min(acc, float2(length(p-float3(3.181818, 3.181818, _Positions[108].z)), 108.));
acc = _min(acc, float2(length(p-float3(4.090909, 3.181818, _Positions[109].z)), 109.));
acc = _min(acc, float2(length(p-float3(-5, 4.090909, _Positions[110].z)), 110.));
acc = _min(acc, float2(length(p-float3(-4.090909, 4.090909, _Positions[111].z)), 111.));
acc = _min(acc, float2(length(p-float3(-3.181818, 4.090909, _Positions[112].z)), 112.));
acc = _min(acc, float2(length(p-float3(-2.272727, 4.090909, _Positions[113].z)), 113.));
acc = _min(acc, float2(length(p-float3(-1.363636, 4.090909, _Positions[114].z)), 114.));
acc = _min(acc, float2(length(p-float3(-0.4545455, 4.090909, _Positions[115].z)), 115.));
acc = _min(acc, float2(length(p-float3(0.4545455, 4.090909, _Positions[116].z)), 116.));
acc = _min(acc, float2(length(p-float3(1.363636, 4.090909, _Positions[117].z)), 117.));
acc = _min(acc, float2(length(p-float3(2.272727, 4.090909, _Positions[118].z)), 118.));
acc = _min(acc, float2(length(p-float3(3.181818, 4.090909, _Positions[119].z)), 119.));
acc = _min(acc, float2(length(p-float3(4.090909, 4.090909, _Positions[120].z)), 120.));
acc = _min(acc, float2(length(p-float3(-5, 5, _Positions[121].z)), 121.));
acc = _min(acc, float2(length(p-float3(-4.090909, 5, _Positions[122].z)), 122.));
acc = _min(acc, float2(length(p-float3(-3.181818, 5, _Positions[123].z)), 123.));
acc = _min(acc, float2(length(p-float3(-2.272727, 5, _Positions[124].z)), 124.));
acc = _min(acc, float2(length(p-float3(-1.363636, 5, _Positions[125].z)), 125.));
acc = _min(acc, float2(length(p-float3(-0.4545455, 5, _Positions[126].z)), 126.));
acc = _min(acc, float2(length(p-float3(0.4545455, 5, _Positions[127].z)), 127.));


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
					//col = _Colors[int(res.z)].xyz;
				}
				col += accCol;
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
