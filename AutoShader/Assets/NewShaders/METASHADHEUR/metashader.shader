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
#define SAMPLES_COUNT 256
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

				acc = _min(acc, float2(length(p-_Positions[0].xyz), 0.));
acc = _min(acc, float2(length(p-_Positions[1].xyz), 1.));
acc = _min(acc, float2(length(p-_Positions[2].xyz), 2.));
acc = _min(acc, float2(length(p-_Positions[3].xyz), 3.));
acc = _min(acc, float2(length(p-_Positions[4].xyz), 4.));
acc = _min(acc, float2(length(p-_Positions[5].xyz), 5.));
acc = _min(acc, float2(length(p-_Positions[6].xyz), 6.));
acc = _min(acc, float2(length(p-_Positions[7].xyz), 7.));
acc = _min(acc, float2(length(p-_Positions[8].xyz), 8.));
acc = _min(acc, float2(length(p-_Positions[9].xyz), 9.));
acc = _min(acc, float2(length(p-_Positions[10].xyz), 10.));
acc = _min(acc, float2(length(p-_Positions[11].xyz), 11.));
acc = _min(acc, float2(length(p-_Positions[12].xyz), 12.));
acc = _min(acc, float2(length(p-_Positions[13].xyz), 13.));
acc = _min(acc, float2(length(p-_Positions[14].xyz), 14.));
acc = _min(acc, float2(length(p-_Positions[15].xyz), 15.));
acc = _min(acc, float2(length(p-_Positions[16].xyz), 16.));
acc = _min(acc, float2(length(p-_Positions[17].xyz), 17.));
acc = _min(acc, float2(length(p-_Positions[18].xyz), 18.));
acc = _min(acc, float2(length(p-_Positions[19].xyz), 19.));
acc = _min(acc, float2(length(p-_Positions[20].xyz), 20.));
acc = _min(acc, float2(length(p-_Positions[21].xyz), 21.));
acc = _min(acc, float2(length(p-_Positions[22].xyz), 22.));
acc = _min(acc, float2(length(p-_Positions[23].xyz), 23.));
acc = _min(acc, float2(length(p-_Positions[24].xyz), 24.));
acc = _min(acc, float2(length(p-_Positions[25].xyz), 25.));
acc = _min(acc, float2(length(p-_Positions[26].xyz), 26.));
acc = _min(acc, float2(length(p-_Positions[27].xyz), 27.));
acc = _min(acc, float2(length(p-_Positions[28].xyz), 28.));
acc = _min(acc, float2(length(p-_Positions[29].xyz), 29.));
acc = _min(acc, float2(length(p-_Positions[30].xyz), 30.));
acc = _min(acc, float2(length(p-_Positions[31].xyz), 31.));
acc = _min(acc, float2(length(p-_Positions[32].xyz), 32.));
acc = _min(acc, float2(length(p-_Positions[33].xyz), 33.));
acc = _min(acc, float2(length(p-_Positions[34].xyz), 34.));
acc = _min(acc, float2(length(p-_Positions[35].xyz), 35.));
acc = _min(acc, float2(length(p-_Positions[36].xyz), 36.));
acc = _min(acc, float2(length(p-_Positions[37].xyz), 37.));
acc = _min(acc, float2(length(p-_Positions[38].xyz), 38.));
acc = _min(acc, float2(length(p-_Positions[39].xyz), 39.));
acc = _min(acc, float2(length(p-_Positions[40].xyz), 40.));
acc = _min(acc, float2(length(p-_Positions[41].xyz), 41.));
acc = _min(acc, float2(length(p-_Positions[42].xyz), 42.));
acc = _min(acc, float2(length(p-_Positions[43].xyz), 43.));
acc = _min(acc, float2(length(p-_Positions[44].xyz), 44.));
acc = _min(acc, float2(length(p-_Positions[45].xyz), 45.));
acc = _min(acc, float2(length(p-_Positions[46].xyz), 46.));
acc = _min(acc, float2(length(p-_Positions[47].xyz), 47.));
acc = _min(acc, float2(length(p-_Positions[48].xyz), 48.));
acc = _min(acc, float2(length(p-_Positions[49].xyz), 49.));
acc = _min(acc, float2(length(p-_Positions[50].xyz), 50.));
acc = _min(acc, float2(length(p-_Positions[51].xyz), 51.));
acc = _min(acc, float2(length(p-_Positions[52].xyz), 52.));
acc = _min(acc, float2(length(p-_Positions[53].xyz), 53.));
acc = _min(acc, float2(length(p-_Positions[54].xyz), 54.));
acc = _min(acc, float2(length(p-_Positions[55].xyz), 55.));
acc = _min(acc, float2(length(p-_Positions[56].xyz), 56.));
acc = _min(acc, float2(length(p-_Positions[57].xyz), 57.));
acc = _min(acc, float2(length(p-_Positions[58].xyz), 58.));
acc = _min(acc, float2(length(p-_Positions[59].xyz), 59.));
acc = _min(acc, float2(length(p-_Positions[60].xyz), 60.));
acc = _min(acc, float2(length(p-_Positions[61].xyz), 61.));
acc = _min(acc, float2(length(p-_Positions[62].xyz), 62.));
acc = _min(acc, float2(length(p-_Positions[63].xyz), 63.));
acc = _min(acc, float2(length(p-_Positions[64].xyz), 64.));
acc = _min(acc, float2(length(p-_Positions[65].xyz), 65.));
acc = _min(acc, float2(length(p-_Positions[66].xyz), 66.));
acc = _min(acc, float2(length(p-_Positions[67].xyz), 67.));
acc = _min(acc, float2(length(p-_Positions[68].xyz), 68.));
acc = _min(acc, float2(length(p-_Positions[69].xyz), 69.));
acc = _min(acc, float2(length(p-_Positions[70].xyz), 70.));
acc = _min(acc, float2(length(p-_Positions[71].xyz), 71.));
acc = _min(acc, float2(length(p-_Positions[72].xyz), 72.));
acc = _min(acc, float2(length(p-_Positions[73].xyz), 73.));
acc = _min(acc, float2(length(p-_Positions[74].xyz), 74.));
acc = _min(acc, float2(length(p-_Positions[75].xyz), 75.));
acc = _min(acc, float2(length(p-_Positions[76].xyz), 76.));
acc = _min(acc, float2(length(p-_Positions[77].xyz), 77.));
acc = _min(acc, float2(length(p-_Positions[78].xyz), 78.));
acc = _min(acc, float2(length(p-_Positions[79].xyz), 79.));
acc = _min(acc, float2(length(p-_Positions[80].xyz), 80.));
acc = _min(acc, float2(length(p-_Positions[81].xyz), 81.));
acc = _min(acc, float2(length(p-_Positions[82].xyz), 82.));
acc = _min(acc, float2(length(p-_Positions[83].xyz), 83.));
acc = _min(acc, float2(length(p-_Positions[84].xyz), 84.));
acc = _min(acc, float2(length(p-_Positions[85].xyz), 85.));
acc = _min(acc, float2(length(p-_Positions[86].xyz), 86.));
acc = _min(acc, float2(length(p-_Positions[87].xyz), 87.));
acc = _min(acc, float2(length(p-_Positions[88].xyz), 88.));
acc = _min(acc, float2(length(p-_Positions[89].xyz), 89.));
acc = _min(acc, float2(length(p-_Positions[90].xyz), 90.));
acc = _min(acc, float2(length(p-_Positions[91].xyz), 91.));
acc = _min(acc, float2(length(p-_Positions[92].xyz), 92.));
acc = _min(acc, float2(length(p-_Positions[93].xyz), 93.));
acc = _min(acc, float2(length(p-_Positions[94].xyz), 94.));
acc = _min(acc, float2(length(p-_Positions[95].xyz), 95.));
acc = _min(acc, float2(length(p-_Positions[96].xyz), 96.));
acc = _min(acc, float2(length(p-_Positions[97].xyz), 97.));
acc = _min(acc, float2(length(p-_Positions[98].xyz), 98.));
acc = _min(acc, float2(length(p-_Positions[99].xyz), 99.));
acc = _min(acc, float2(length(p-_Positions[100].xyz), 100.));
acc = _min(acc, float2(length(p-_Positions[101].xyz), 101.));
acc = _min(acc, float2(length(p-_Positions[102].xyz), 102.));
acc = _min(acc, float2(length(p-_Positions[103].xyz), 103.));
acc = _min(acc, float2(length(p-_Positions[104].xyz), 104.));
acc = _min(acc, float2(length(p-_Positions[105].xyz), 105.));
acc = _min(acc, float2(length(p-_Positions[106].xyz), 106.));
acc = _min(acc, float2(length(p-_Positions[107].xyz), 107.));
acc = _min(acc, float2(length(p-_Positions[108].xyz), 108.));
acc = _min(acc, float2(length(p-_Positions[109].xyz), 109.));
acc = _min(acc, float2(length(p-_Positions[110].xyz), 110.));
acc = _min(acc, float2(length(p-_Positions[111].xyz), 111.));
acc = _min(acc, float2(length(p-_Positions[112].xyz), 112.));
acc = _min(acc, float2(length(p-_Positions[113].xyz), 113.));
acc = _min(acc, float2(length(p-_Positions[114].xyz), 114.));
acc = _min(acc, float2(length(p-_Positions[115].xyz), 115.));
acc = _min(acc, float2(length(p-_Positions[116].xyz), 116.));
acc = _min(acc, float2(length(p-_Positions[117].xyz), 117.));
acc = _min(acc, float2(length(p-_Positions[118].xyz), 118.));
acc = _min(acc, float2(length(p-_Positions[119].xyz), 119.));
acc = _min(acc, float2(length(p-_Positions[120].xyz), 120.));
acc = _min(acc, float2(length(p-_Positions[121].xyz), 121.));
acc = _min(acc, float2(length(p-_Positions[122].xyz), 122.));
acc = _min(acc, float2(length(p-_Positions[123].xyz), 123.));
acc = _min(acc, float2(length(p-_Positions[124].xyz), 124.));
acc = _min(acc, float2(length(p-_Positions[125].xyz), 125.));
acc = _min(acc, float2(length(p-_Positions[126].xyz), 126.));
acc = _min(acc, float2(length(p-_Positions[127].xyz), 127.));
acc = _min(acc, float2(length(p-_Positions[128].xyz), 128.));
acc = _min(acc, float2(length(p-_Positions[129].xyz), 129.));
acc = _min(acc, float2(length(p-_Positions[130].xyz), 130.));
acc = _min(acc, float2(length(p-_Positions[131].xyz), 131.));
acc = _min(acc, float2(length(p-_Positions[132].xyz), 132.));
acc = _min(acc, float2(length(p-_Positions[133].xyz), 133.));
acc = _min(acc, float2(length(p-_Positions[134].xyz), 134.));
acc = _min(acc, float2(length(p-_Positions[135].xyz), 135.));
acc = _min(acc, float2(length(p-_Positions[136].xyz), 136.));
acc = _min(acc, float2(length(p-_Positions[137].xyz), 137.));
acc = _min(acc, float2(length(p-_Positions[138].xyz), 138.));
acc = _min(acc, float2(length(p-_Positions[139].xyz), 139.));
acc = _min(acc, float2(length(p-_Positions[140].xyz), 140.));
acc = _min(acc, float2(length(p-_Positions[141].xyz), 141.));
acc = _min(acc, float2(length(p-_Positions[142].xyz), 142.));
acc = _min(acc, float2(length(p-_Positions[143].xyz), 143.));
acc = _min(acc, float2(length(p-_Positions[144].xyz), 144.));
acc = _min(acc, float2(length(p-_Positions[145].xyz), 145.));
acc = _min(acc, float2(length(p-_Positions[146].xyz), 146.));
acc = _min(acc, float2(length(p-_Positions[147].xyz), 147.));
acc = _min(acc, float2(length(p-_Positions[148].xyz), 148.));
acc = _min(acc, float2(length(p-_Positions[149].xyz), 149.));
acc = _min(acc, float2(length(p-_Positions[150].xyz), 150.));
acc = _min(acc, float2(length(p-_Positions[151].xyz), 151.));
acc = _min(acc, float2(length(p-_Positions[152].xyz), 152.));
acc = _min(acc, float2(length(p-_Positions[153].xyz), 153.));
acc = _min(acc, float2(length(p-_Positions[154].xyz), 154.));
acc = _min(acc, float2(length(p-_Positions[155].xyz), 155.));
acc = _min(acc, float2(length(p-_Positions[156].xyz), 156.));
acc = _min(acc, float2(length(p-_Positions[157].xyz), 157.));
acc = _min(acc, float2(length(p-_Positions[158].xyz), 158.));
acc = _min(acc, float2(length(p-_Positions[159].xyz), 159.));
acc = _min(acc, float2(length(p-_Positions[160].xyz), 160.));
acc = _min(acc, float2(length(p-_Positions[161].xyz), 161.));
acc = _min(acc, float2(length(p-_Positions[162].xyz), 162.));
acc = _min(acc, float2(length(p-_Positions[163].xyz), 163.));
acc = _min(acc, float2(length(p-_Positions[164].xyz), 164.));
acc = _min(acc, float2(length(p-_Positions[165].xyz), 165.));
acc = _min(acc, float2(length(p-_Positions[166].xyz), 166.));
acc = _min(acc, float2(length(p-_Positions[167].xyz), 167.));
acc = _min(acc, float2(length(p-_Positions[168].xyz), 168.));
acc = _min(acc, float2(length(p-_Positions[169].xyz), 169.));
acc = _min(acc, float2(length(p-_Positions[170].xyz), 170.));
acc = _min(acc, float2(length(p-_Positions[171].xyz), 171.));
acc = _min(acc, float2(length(p-_Positions[172].xyz), 172.));
acc = _min(acc, float2(length(p-_Positions[173].xyz), 173.));
acc = _min(acc, float2(length(p-_Positions[174].xyz), 174.));
acc = _min(acc, float2(length(p-_Positions[175].xyz), 175.));
acc = _min(acc, float2(length(p-_Positions[176].xyz), 176.));
acc = _min(acc, float2(length(p-_Positions[177].xyz), 177.));
acc = _min(acc, float2(length(p-_Positions[178].xyz), 178.));
acc = _min(acc, float2(length(p-_Positions[179].xyz), 179.));
acc = _min(acc, float2(length(p-_Positions[180].xyz), 180.));
acc = _min(acc, float2(length(p-_Positions[181].xyz), 181.));
acc = _min(acc, float2(length(p-_Positions[182].xyz), 182.));
acc = _min(acc, float2(length(p-_Positions[183].xyz), 183.));
acc = _min(acc, float2(length(p-_Positions[184].xyz), 184.));
acc = _min(acc, float2(length(p-_Positions[185].xyz), 185.));
acc = _min(acc, float2(length(p-_Positions[186].xyz), 186.));
acc = _min(acc, float2(length(p-_Positions[187].xyz), 187.));
acc = _min(acc, float2(length(p-_Positions[188].xyz), 188.));
acc = _min(acc, float2(length(p-_Positions[189].xyz), 189.));
acc = _min(acc, float2(length(p-_Positions[190].xyz), 190.));
acc = _min(acc, float2(length(p-_Positions[191].xyz), 191.));
acc = _min(acc, float2(length(p-_Positions[192].xyz), 192.));
acc = _min(acc, float2(length(p-_Positions[193].xyz), 193.));
acc = _min(acc, float2(length(p-_Positions[194].xyz), 194.));
acc = _min(acc, float2(length(p-_Positions[195].xyz), 195.));
acc = _min(acc, float2(length(p-_Positions[196].xyz), 196.));
acc = _min(acc, float2(length(p-_Positions[197].xyz), 197.));
acc = _min(acc, float2(length(p-_Positions[198].xyz), 198.));
acc = _min(acc, float2(length(p-_Positions[199].xyz), 199.));
acc = _min(acc, float2(length(p-_Positions[200].xyz), 200.));
acc = _min(acc, float2(length(p-_Positions[201].xyz), 201.));
acc = _min(acc, float2(length(p-_Positions[202].xyz), 202.));
acc = _min(acc, float2(length(p-_Positions[203].xyz), 203.));
acc = _min(acc, float2(length(p-_Positions[204].xyz), 204.));
acc = _min(acc, float2(length(p-_Positions[205].xyz), 205.));
acc = _min(acc, float2(length(p-_Positions[206].xyz), 206.));
acc = _min(acc, float2(length(p-_Positions[207].xyz), 207.));
acc = _min(acc, float2(length(p-_Positions[208].xyz), 208.));
acc = _min(acc, float2(length(p-_Positions[209].xyz), 209.));
acc = _min(acc, float2(length(p-_Positions[210].xyz), 210.));
acc = _min(acc, float2(length(p-_Positions[211].xyz), 211.));
acc = _min(acc, float2(length(p-_Positions[212].xyz), 212.));
acc = _min(acc, float2(length(p-_Positions[213].xyz), 213.));
acc = _min(acc, float2(length(p-_Positions[214].xyz), 214.));
acc = _min(acc, float2(length(p-_Positions[215].xyz), 215.));
acc = _min(acc, float2(length(p-_Positions[216].xyz), 216.));
acc = _min(acc, float2(length(p-_Positions[217].xyz), 217.));
acc = _min(acc, float2(length(p-_Positions[218].xyz), 218.));
acc = _min(acc, float2(length(p-_Positions[219].xyz), 219.));
acc = _min(acc, float2(length(p-_Positions[220].xyz), 220.));
acc = _min(acc, float2(length(p-_Positions[221].xyz), 221.));
acc = _min(acc, float2(length(p-_Positions[222].xyz), 222.));
acc = _min(acc, float2(length(p-_Positions[223].xyz), 223.));
acc = _min(acc, float2(length(p-_Positions[224].xyz), 224.));
acc = _min(acc, float2(length(p-_Positions[225].xyz), 225.));
acc = _min(acc, float2(length(p-_Positions[226].xyz), 226.));
acc = _min(acc, float2(length(p-_Positions[227].xyz), 227.));
acc = _min(acc, float2(length(p-_Positions[228].xyz), 228.));
acc = _min(acc, float2(length(p-_Positions[229].xyz), 229.));
acc = _min(acc, float2(length(p-_Positions[230].xyz), 230.));
acc = _min(acc, float2(length(p-_Positions[231].xyz), 231.));
acc = _min(acc, float2(length(p-_Positions[232].xyz), 232.));
acc = _min(acc, float2(length(p-_Positions[233].xyz), 233.));
acc = _min(acc, float2(length(p-_Positions[234].xyz), 234.));
acc = _min(acc, float2(length(p-_Positions[235].xyz), 235.));
acc = _min(acc, float2(length(p-_Positions[236].xyz), 236.));
acc = _min(acc, float2(length(p-_Positions[237].xyz), 237.));
acc = _min(acc, float2(length(p-_Positions[238].xyz), 238.));
acc = _min(acc, float2(length(p-_Positions[239].xyz), 239.));
acc = _min(acc, float2(length(p-_Positions[240].xyz), 240.));
acc = _min(acc, float2(length(p-_Positions[241].xyz), 241.));
acc = _min(acc, float2(length(p-_Positions[242].xyz), 242.));
acc = _min(acc, float2(length(p-_Positions[243].xyz), 243.));
acc = _min(acc, float2(length(p-_Positions[244].xyz), 244.));
acc = _min(acc, float2(length(p-_Positions[245].xyz), 245.));
acc = _min(acc, float2(length(p-_Positions[246].xyz), 246.));
acc = _min(acc, float2(length(p-_Positions[247].xyz), 247.));
acc = _min(acc, float2(length(p-_Positions[248].xyz), 248.));
acc = _min(acc, float2(length(p-_Positions[249].xyz), 249.));
acc = _min(acc, float2(length(p-_Positions[250].xyz), 250.));
acc = _min(acc, float2(length(p-_Positions[251].xyz), 251.));
acc = _min(acc, float2(length(p-_Positions[252].xyz), 252.));
acc = _min(acc, float2(length(p-_Positions[253].xyz), 253.));
acc = _min(acc, float2(length(p-_Positions[254].xyz), 254.));
acc = _min(acc, float2(length(p-_Positions[255].xyz), 255.));


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
