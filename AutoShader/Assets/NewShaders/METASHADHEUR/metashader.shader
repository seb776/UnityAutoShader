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
#define SAMPLES_COUNT 512
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
acc = _min(acc, float2(length(p-_Positions[256].xyz), 256.));
acc = _min(acc, float2(length(p-_Positions[257].xyz), 257.));
acc = _min(acc, float2(length(p-_Positions[258].xyz), 258.));
acc = _min(acc, float2(length(p-_Positions[259].xyz), 259.));
acc = _min(acc, float2(length(p-_Positions[260].xyz), 260.));
acc = _min(acc, float2(length(p-_Positions[261].xyz), 261.));
acc = _min(acc, float2(length(p-_Positions[262].xyz), 262.));
acc = _min(acc, float2(length(p-_Positions[263].xyz), 263.));
acc = _min(acc, float2(length(p-_Positions[264].xyz), 264.));
acc = _min(acc, float2(length(p-_Positions[265].xyz), 265.));
acc = _min(acc, float2(length(p-_Positions[266].xyz), 266.));
acc = _min(acc, float2(length(p-_Positions[267].xyz), 267.));
acc = _min(acc, float2(length(p-_Positions[268].xyz), 268.));
acc = _min(acc, float2(length(p-_Positions[269].xyz), 269.));
acc = _min(acc, float2(length(p-_Positions[270].xyz), 270.));
acc = _min(acc, float2(length(p-_Positions[271].xyz), 271.));
acc = _min(acc, float2(length(p-_Positions[272].xyz), 272.));
acc = _min(acc, float2(length(p-_Positions[273].xyz), 273.));
acc = _min(acc, float2(length(p-_Positions[274].xyz), 274.));
acc = _min(acc, float2(length(p-_Positions[275].xyz), 275.));
acc = _min(acc, float2(length(p-_Positions[276].xyz), 276.));
acc = _min(acc, float2(length(p-_Positions[277].xyz), 277.));
acc = _min(acc, float2(length(p-_Positions[278].xyz), 278.));
acc = _min(acc, float2(length(p-_Positions[279].xyz), 279.));
acc = _min(acc, float2(length(p-_Positions[280].xyz), 280.));
acc = _min(acc, float2(length(p-_Positions[281].xyz), 281.));
acc = _min(acc, float2(length(p-_Positions[282].xyz), 282.));
acc = _min(acc, float2(length(p-_Positions[283].xyz), 283.));
acc = _min(acc, float2(length(p-_Positions[284].xyz), 284.));
acc = _min(acc, float2(length(p-_Positions[285].xyz), 285.));
acc = _min(acc, float2(length(p-_Positions[286].xyz), 286.));
acc = _min(acc, float2(length(p-_Positions[287].xyz), 287.));
acc = _min(acc, float2(length(p-_Positions[288].xyz), 288.));
acc = _min(acc, float2(length(p-_Positions[289].xyz), 289.));
acc = _min(acc, float2(length(p-_Positions[290].xyz), 290.));
acc = _min(acc, float2(length(p-_Positions[291].xyz), 291.));
acc = _min(acc, float2(length(p-_Positions[292].xyz), 292.));
acc = _min(acc, float2(length(p-_Positions[293].xyz), 293.));
acc = _min(acc, float2(length(p-_Positions[294].xyz), 294.));
acc = _min(acc, float2(length(p-_Positions[295].xyz), 295.));
acc = _min(acc, float2(length(p-_Positions[296].xyz), 296.));
acc = _min(acc, float2(length(p-_Positions[297].xyz), 297.));
acc = _min(acc, float2(length(p-_Positions[298].xyz), 298.));
acc = _min(acc, float2(length(p-_Positions[299].xyz), 299.));
acc = _min(acc, float2(length(p-_Positions[300].xyz), 300.));
acc = _min(acc, float2(length(p-_Positions[301].xyz), 301.));
acc = _min(acc, float2(length(p-_Positions[302].xyz), 302.));
acc = _min(acc, float2(length(p-_Positions[303].xyz), 303.));
acc = _min(acc, float2(length(p-_Positions[304].xyz), 304.));
acc = _min(acc, float2(length(p-_Positions[305].xyz), 305.));
acc = _min(acc, float2(length(p-_Positions[306].xyz), 306.));
acc = _min(acc, float2(length(p-_Positions[307].xyz), 307.));
acc = _min(acc, float2(length(p-_Positions[308].xyz), 308.));
acc = _min(acc, float2(length(p-_Positions[309].xyz), 309.));
acc = _min(acc, float2(length(p-_Positions[310].xyz), 310.));
acc = _min(acc, float2(length(p-_Positions[311].xyz), 311.));
acc = _min(acc, float2(length(p-_Positions[312].xyz), 312.));
acc = _min(acc, float2(length(p-_Positions[313].xyz), 313.));
acc = _min(acc, float2(length(p-_Positions[314].xyz), 314.));
acc = _min(acc, float2(length(p-_Positions[315].xyz), 315.));
acc = _min(acc, float2(length(p-_Positions[316].xyz), 316.));
acc = _min(acc, float2(length(p-_Positions[317].xyz), 317.));
acc = _min(acc, float2(length(p-_Positions[318].xyz), 318.));
acc = _min(acc, float2(length(p-_Positions[319].xyz), 319.));
acc = _min(acc, float2(length(p-_Positions[320].xyz), 320.));
acc = _min(acc, float2(length(p-_Positions[321].xyz), 321.));
acc = _min(acc, float2(length(p-_Positions[322].xyz), 322.));
acc = _min(acc, float2(length(p-_Positions[323].xyz), 323.));
acc = _min(acc, float2(length(p-_Positions[324].xyz), 324.));
acc = _min(acc, float2(length(p-_Positions[325].xyz), 325.));
acc = _min(acc, float2(length(p-_Positions[326].xyz), 326.));
acc = _min(acc, float2(length(p-_Positions[327].xyz), 327.));
acc = _min(acc, float2(length(p-_Positions[328].xyz), 328.));
acc = _min(acc, float2(length(p-_Positions[329].xyz), 329.));
acc = _min(acc, float2(length(p-_Positions[330].xyz), 330.));
acc = _min(acc, float2(length(p-_Positions[331].xyz), 331.));
acc = _min(acc, float2(length(p-_Positions[332].xyz), 332.));
acc = _min(acc, float2(length(p-_Positions[333].xyz), 333.));
acc = _min(acc, float2(length(p-_Positions[334].xyz), 334.));
acc = _min(acc, float2(length(p-_Positions[335].xyz), 335.));
acc = _min(acc, float2(length(p-_Positions[336].xyz), 336.));
acc = _min(acc, float2(length(p-_Positions[337].xyz), 337.));
acc = _min(acc, float2(length(p-_Positions[338].xyz), 338.));
acc = _min(acc, float2(length(p-_Positions[339].xyz), 339.));
acc = _min(acc, float2(length(p-_Positions[340].xyz), 340.));
acc = _min(acc, float2(length(p-_Positions[341].xyz), 341.));
acc = _min(acc, float2(length(p-_Positions[342].xyz), 342.));
acc = _min(acc, float2(length(p-_Positions[343].xyz), 343.));
acc = _min(acc, float2(length(p-_Positions[344].xyz), 344.));
acc = _min(acc, float2(length(p-_Positions[345].xyz), 345.));
acc = _min(acc, float2(length(p-_Positions[346].xyz), 346.));
acc = _min(acc, float2(length(p-_Positions[347].xyz), 347.));
acc = _min(acc, float2(length(p-_Positions[348].xyz), 348.));
acc = _min(acc, float2(length(p-_Positions[349].xyz), 349.));
acc = _min(acc, float2(length(p-_Positions[350].xyz), 350.));
acc = _min(acc, float2(length(p-_Positions[351].xyz), 351.));
acc = _min(acc, float2(length(p-_Positions[352].xyz), 352.));
acc = _min(acc, float2(length(p-_Positions[353].xyz), 353.));
acc = _min(acc, float2(length(p-_Positions[354].xyz), 354.));
acc = _min(acc, float2(length(p-_Positions[355].xyz), 355.));
acc = _min(acc, float2(length(p-_Positions[356].xyz), 356.));
acc = _min(acc, float2(length(p-_Positions[357].xyz), 357.));
acc = _min(acc, float2(length(p-_Positions[358].xyz), 358.));
acc = _min(acc, float2(length(p-_Positions[359].xyz), 359.));
acc = _min(acc, float2(length(p-_Positions[360].xyz), 360.));
acc = _min(acc, float2(length(p-_Positions[361].xyz), 361.));
acc = _min(acc, float2(length(p-_Positions[362].xyz), 362.));
acc = _min(acc, float2(length(p-_Positions[363].xyz), 363.));
acc = _min(acc, float2(length(p-_Positions[364].xyz), 364.));
acc = _min(acc, float2(length(p-_Positions[365].xyz), 365.));
acc = _min(acc, float2(length(p-_Positions[366].xyz), 366.));
acc = _min(acc, float2(length(p-_Positions[367].xyz), 367.));
acc = _min(acc, float2(length(p-_Positions[368].xyz), 368.));
acc = _min(acc, float2(length(p-_Positions[369].xyz), 369.));
acc = _min(acc, float2(length(p-_Positions[370].xyz), 370.));
acc = _min(acc, float2(length(p-_Positions[371].xyz), 371.));
acc = _min(acc, float2(length(p-_Positions[372].xyz), 372.));
acc = _min(acc, float2(length(p-_Positions[373].xyz), 373.));
acc = _min(acc, float2(length(p-_Positions[374].xyz), 374.));
acc = _min(acc, float2(length(p-_Positions[375].xyz), 375.));
acc = _min(acc, float2(length(p-_Positions[376].xyz), 376.));
acc = _min(acc, float2(length(p-_Positions[377].xyz), 377.));
acc = _min(acc, float2(length(p-_Positions[378].xyz), 378.));
acc = _min(acc, float2(length(p-_Positions[379].xyz), 379.));
acc = _min(acc, float2(length(p-_Positions[380].xyz), 380.));
acc = _min(acc, float2(length(p-_Positions[381].xyz), 381.));
acc = _min(acc, float2(length(p-_Positions[382].xyz), 382.));
acc = _min(acc, float2(length(p-_Positions[383].xyz), 383.));
acc = _min(acc, float2(length(p-_Positions[384].xyz), 384.));
acc = _min(acc, float2(length(p-_Positions[385].xyz), 385.));
acc = _min(acc, float2(length(p-_Positions[386].xyz), 386.));
acc = _min(acc, float2(length(p-_Positions[387].xyz), 387.));
acc = _min(acc, float2(length(p-_Positions[388].xyz), 388.));
acc = _min(acc, float2(length(p-_Positions[389].xyz), 389.));
acc = _min(acc, float2(length(p-_Positions[390].xyz), 390.));
acc = _min(acc, float2(length(p-_Positions[391].xyz), 391.));
acc = _min(acc, float2(length(p-_Positions[392].xyz), 392.));
acc = _min(acc, float2(length(p-_Positions[393].xyz), 393.));
acc = _min(acc, float2(length(p-_Positions[394].xyz), 394.));
acc = _min(acc, float2(length(p-_Positions[395].xyz), 395.));
acc = _min(acc, float2(length(p-_Positions[396].xyz), 396.));
acc = _min(acc, float2(length(p-_Positions[397].xyz), 397.));
acc = _min(acc, float2(length(p-_Positions[398].xyz), 398.));
acc = _min(acc, float2(length(p-_Positions[399].xyz), 399.));
acc = _min(acc, float2(length(p-_Positions[400].xyz), 400.));
acc = _min(acc, float2(length(p-_Positions[401].xyz), 401.));
acc = _min(acc, float2(length(p-_Positions[402].xyz), 402.));
acc = _min(acc, float2(length(p-_Positions[403].xyz), 403.));
acc = _min(acc, float2(length(p-_Positions[404].xyz), 404.));
acc = _min(acc, float2(length(p-_Positions[405].xyz), 405.));
acc = _min(acc, float2(length(p-_Positions[406].xyz), 406.));
acc = _min(acc, float2(length(p-_Positions[407].xyz), 407.));
acc = _min(acc, float2(length(p-_Positions[408].xyz), 408.));
acc = _min(acc, float2(length(p-_Positions[409].xyz), 409.));
acc = _min(acc, float2(length(p-_Positions[410].xyz), 410.));
acc = _min(acc, float2(length(p-_Positions[411].xyz), 411.));
acc = _min(acc, float2(length(p-_Positions[412].xyz), 412.));
acc = _min(acc, float2(length(p-_Positions[413].xyz), 413.));
acc = _min(acc, float2(length(p-_Positions[414].xyz), 414.));
acc = _min(acc, float2(length(p-_Positions[415].xyz), 415.));
acc = _min(acc, float2(length(p-_Positions[416].xyz), 416.));
acc = _min(acc, float2(length(p-_Positions[417].xyz), 417.));
acc = _min(acc, float2(length(p-_Positions[418].xyz), 418.));
acc = _min(acc, float2(length(p-_Positions[419].xyz), 419.));
acc = _min(acc, float2(length(p-_Positions[420].xyz), 420.));
acc = _min(acc, float2(length(p-_Positions[421].xyz), 421.));
acc = _min(acc, float2(length(p-_Positions[422].xyz), 422.));
acc = _min(acc, float2(length(p-_Positions[423].xyz), 423.));
acc = _min(acc, float2(length(p-_Positions[424].xyz), 424.));
acc = _min(acc, float2(length(p-_Positions[425].xyz), 425.));
acc = _min(acc, float2(length(p-_Positions[426].xyz), 426.));
acc = _min(acc, float2(length(p-_Positions[427].xyz), 427.));
acc = _min(acc, float2(length(p-_Positions[428].xyz), 428.));
acc = _min(acc, float2(length(p-_Positions[429].xyz), 429.));
acc = _min(acc, float2(length(p-_Positions[430].xyz), 430.));
acc = _min(acc, float2(length(p-_Positions[431].xyz), 431.));
acc = _min(acc, float2(length(p-_Positions[432].xyz), 432.));
acc = _min(acc, float2(length(p-_Positions[433].xyz), 433.));
acc = _min(acc, float2(length(p-_Positions[434].xyz), 434.));
acc = _min(acc, float2(length(p-_Positions[435].xyz), 435.));
acc = _min(acc, float2(length(p-_Positions[436].xyz), 436.));
acc = _min(acc, float2(length(p-_Positions[437].xyz), 437.));
acc = _min(acc, float2(length(p-_Positions[438].xyz), 438.));
acc = _min(acc, float2(length(p-_Positions[439].xyz), 439.));
acc = _min(acc, float2(length(p-_Positions[440].xyz), 440.));
acc = _min(acc, float2(length(p-_Positions[441].xyz), 441.));
acc = _min(acc, float2(length(p-_Positions[442].xyz), 442.));
acc = _min(acc, float2(length(p-_Positions[443].xyz), 443.));
acc = _min(acc, float2(length(p-_Positions[444].xyz), 444.));
acc = _min(acc, float2(length(p-_Positions[445].xyz), 445.));
acc = _min(acc, float2(length(p-_Positions[446].xyz), 446.));
acc = _min(acc, float2(length(p-_Positions[447].xyz), 447.));
acc = _min(acc, float2(length(p-_Positions[448].xyz), 448.));
acc = _min(acc, float2(length(p-_Positions[449].xyz), 449.));
acc = _min(acc, float2(length(p-_Positions[450].xyz), 450.));
acc = _min(acc, float2(length(p-_Positions[451].xyz), 451.));
acc = _min(acc, float2(length(p-_Positions[452].xyz), 452.));
acc = _min(acc, float2(length(p-_Positions[453].xyz), 453.));
acc = _min(acc, float2(length(p-_Positions[454].xyz), 454.));
acc = _min(acc, float2(length(p-_Positions[455].xyz), 455.));
acc = _min(acc, float2(length(p-_Positions[456].xyz), 456.));
acc = _min(acc, float2(length(p-_Positions[457].xyz), 457.));
acc = _min(acc, float2(length(p-_Positions[458].xyz), 458.));
acc = _min(acc, float2(length(p-_Positions[459].xyz), 459.));
acc = _min(acc, float2(length(p-_Positions[460].xyz), 460.));
acc = _min(acc, float2(length(p-_Positions[461].xyz), 461.));
acc = _min(acc, float2(length(p-_Positions[462].xyz), 462.));
acc = _min(acc, float2(length(p-_Positions[463].xyz), 463.));
acc = _min(acc, float2(length(p-_Positions[464].xyz), 464.));
acc = _min(acc, float2(length(p-_Positions[465].xyz), 465.));
acc = _min(acc, float2(length(p-_Positions[466].xyz), 466.));
acc = _min(acc, float2(length(p-_Positions[467].xyz), 467.));
acc = _min(acc, float2(length(p-_Positions[468].xyz), 468.));
acc = _min(acc, float2(length(p-_Positions[469].xyz), 469.));
acc = _min(acc, float2(length(p-_Positions[470].xyz), 470.));
acc = _min(acc, float2(length(p-_Positions[471].xyz), 471.));
acc = _min(acc, float2(length(p-_Positions[472].xyz), 472.));
acc = _min(acc, float2(length(p-_Positions[473].xyz), 473.));
acc = _min(acc, float2(length(p-_Positions[474].xyz), 474.));
acc = _min(acc, float2(length(p-_Positions[475].xyz), 475.));
acc = _min(acc, float2(length(p-_Positions[476].xyz), 476.));
acc = _min(acc, float2(length(p-_Positions[477].xyz), 477.));
acc = _min(acc, float2(length(p-_Positions[478].xyz), 478.));
acc = _min(acc, float2(length(p-_Positions[479].xyz), 479.));
acc = _min(acc, float2(length(p-_Positions[480].xyz), 480.));
acc = _min(acc, float2(length(p-_Positions[481].xyz), 481.));
acc = _min(acc, float2(length(p-_Positions[482].xyz), 482.));
acc = _min(acc, float2(length(p-_Positions[483].xyz), 483.));
acc = _min(acc, float2(length(p-_Positions[484].xyz), 484.));
acc = _min(acc, float2(length(p-_Positions[485].xyz), 485.));
acc = _min(acc, float2(length(p-_Positions[486].xyz), 486.));
acc = _min(acc, float2(length(p-_Positions[487].xyz), 487.));
acc = _min(acc, float2(length(p-_Positions[488].xyz), 488.));
acc = _min(acc, float2(length(p-_Positions[489].xyz), 489.));
acc = _min(acc, float2(length(p-_Positions[490].xyz), 490.));
acc = _min(acc, float2(length(p-_Positions[491].xyz), 491.));
acc = _min(acc, float2(length(p-_Positions[492].xyz), 492.));
acc = _min(acc, float2(length(p-_Positions[493].xyz), 493.));
acc = _min(acc, float2(length(p-_Positions[494].xyz), 494.));
acc = _min(acc, float2(length(p-_Positions[495].xyz), 495.));
acc = _min(acc, float2(length(p-_Positions[496].xyz), 496.));
acc = _min(acc, float2(length(p-_Positions[497].xyz), 497.));
acc = _min(acc, float2(length(p-_Positions[498].xyz), 498.));
acc = _min(acc, float2(length(p-_Positions[499].xyz), 499.));
acc = _min(acc, float2(length(p-_Positions[500].xyz), 500.));
acc = _min(acc, float2(length(p-_Positions[501].xyz), 501.));
acc = _min(acc, float2(length(p-_Positions[502].xyz), 502.));
acc = _min(acc, float2(length(p-_Positions[503].xyz), 503.));
acc = _min(acc, float2(length(p-_Positions[504].xyz), 504.));
acc = _min(acc, float2(length(p-_Positions[505].xyz), 505.));
acc = _min(acc, float2(length(p-_Positions[506].xyz), 506.));
acc = _min(acc, float2(length(p-_Positions[507].xyz), 507.));
acc = _min(acc, float2(length(p-_Positions[508].xyz), 508.));
acc = _min(acc, float2(length(p-_Positions[509].xyz), 509.));
acc = _min(acc, float2(length(p-_Positions[510].xyz), 510.));
acc = _min(acc, float2(length(p-_Positions[511].xyz), 511.));


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
