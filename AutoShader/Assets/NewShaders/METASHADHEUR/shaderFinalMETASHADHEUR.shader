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

				acc = _min(acc, float2(length(p-float3(0.2156096, -1.079809, 0)) - 0.9263464, 0.));
acc = _min(acc, float2(length(p-float3(3.139497, -0.4513578, 0)) - 1.448515, 1.));
acc = _min(acc, float2(length(p-float3(-4.944047, -0.4798775, 0)) - 0.3282297, 2.));
acc = _min(acc, float2(length(p-float3(0.1292233, -2.031913, 0)) - 1.65551, 3.));
acc = _min(acc, float2(length(p-float3(-3.304889, -2.378168, 0)) - 0.9040951, 4.));
acc = _min(acc, float2(length(p-float3(4.885513, -4.84549, 0)) - 1.368513, 5.));
acc = _min(acc, float2(length(p-float3(4.653206, -3.174472, 0)) - 1.003403, 6.));
acc = _min(acc, float2(length(p-float3(3.160243, -1.408046, 0)) - 0.5063907, 7.));
acc = _min(acc, float2(length(p-float3(-2.603031, 3.02285, 0)) - 0.3407403, 8.));
acc = _min(acc, float2(length(p-float3(0.9711628, -1.628938, 0)) - 0.6746398, 9.));
acc = _min(acc, float2(length(p-float3(-0.2118974, -3.02116, 0)) - 0.5693763, 10.));
acc = _min(acc, float2(length(p-float3(2.597996, -1.775809, 0)) - 0.1173164, 11.));
acc = _min(acc, float2(length(p-float3(0.6078343, -1.808643, 0)) - 0.2453383, 12.));
acc = _min(acc, float2(length(p-float3(2.76613, -3.987452, 0)) - 0.7358221, 13.));
acc = _min(acc, float2(length(p-float3(-3.549612, -2.674378, 0)) - 0.7531697, 14.));
acc = _min(acc, float2(length(p-float3(3.728826, -1.317679, 0)) - 1.747282, 15.));
acc = _min(acc, float2(length(p-float3(-0.2476792, 3.855841, 0)) - 1.241088, 16.));
acc = _min(acc, float2(length(p-float3(-1.7256, -3.676605, 0)) - 0.8117479, 17.));
acc = _min(acc, float2(length(p-float3(2.362317, -2.809282, 0)) - 1.835046, 18.));
acc = _min(acc, float2(length(p-float3(2.463171, 2.480822, 0)) - 1.955425, 19.));
acc = _min(acc, float2(length(p-float3(-4.463663, -3.884938, 0)) - 1.352462, 20.));
acc = _min(acc, float2(length(p-float3(-4.745608, 3.757503, 0)) - 1.092205, 21.));
acc = _min(acc, float2(length(p-float3(-1.821816, 1.690256, 0)) - 0.3371818, 22.));
acc = _min(acc, float2(length(p-float3(-4.187618, 2.654146, 0)) - 0.2856069, 23.));
acc = _min(acc, float2(length(p-float3(-1.626405, 1.461658, 0)) - 1.475681, 24.));
acc = _min(acc, float2(length(p-float3(-0.05681944, 0.4569249, 0)) - 1.953063, 25.));
acc = _min(acc, float2(length(p-float3(-3.410148, -3.850858, 0)) - 1.382913, 26.));
acc = _min(acc, float2(length(p-float3(-2.777398, -0.1074309, 0)) - 0.4175898, 27.));
acc = _min(acc, float2(length(p-float3(-2.367626, -4.419518, 0)) - 1.39656, 28.));
acc = _min(acc, float2(length(p-float3(-2.596726, -1.252844, 0)) - 0.6642622, 29.));
acc = _min(acc, float2(length(p-float3(-2.153818, 3.5465, 0)) - 0.2491557, 30.));
acc = _min(acc, float2(length(p-float3(-0.2133613, -3.931635, 0)) - 1.036017, 31.));
acc = _min(acc, float2(length(p-float3(0.2885337, -0.6035237, 0)) - 1.367441, 32.));
acc = _min(acc, float2(length(p-float3(-0.788651, -4.684562, 0)) - 0.9255625, 33.));
acc = _min(acc, float2(length(p-float3(1.432478, 1.270459, 0)) - 1.394918, 34.));
acc = _min(acc, float2(length(p-float3(3.267923, 1.994501, 0)) - 1.239561, 35.));
acc = _min(acc, float2(length(p-float3(-2.88144, -4.181394, 0)) - 1.500839, 36.));
acc = _min(acc, float2(length(p-float3(3.383816, -2.951283, 0)) - 1.067556, 37.));
acc = _min(acc, float2(length(p-float3(-2.935528, -2.887134, 0)) - 1.564224, 38.));
acc = _min(acc, float2(length(p-float3(2.967876, -4.427107, 0)) - 1.433728, 39.));
acc = _min(acc, float2(length(p-float3(-0.7998877, 2.628621, 0)) - 0.3118879, 40.));
acc = _min(acc, float2(length(p-float3(3.937902, 4.91845, 0)) - 1.271698, 41.));


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
				float3 cols[42];
cols[0] = float3(0.3541002, 0.04704916, 0.9122007);
cols[1] = float3(0.5315381, 0.3517296, 0.4771755);
cols[2] = float3(0.6555057, 0.1280499, 0.9744762);
cols[3] = float3(0.4557202, 0.6374228, 0.1049305);
cols[4] = float3(0.5783651, 0.3248979, 0.3579345);
cols[5] = float3(0.05920804, 0.5803726, 0.3958251);
cols[6] = float3(0.02266824, 0.7032849, 0.5925972);
cols[7] = float3(0.5597115, 0.7896465, 0.43272);
cols[8] = float3(0.4137843, 0.2817929, 0.5917637);
cols[9] = float3(0.5304095, 0.3313679, 0.4625071);
cols[10] = float3(0.7194878, 0.8805352, 0.9986149);
cols[11] = float3(0.1237066, 0.964365, 0.3866555);
cols[12] = float3(0.6293143, 0.6280384, 0.6792637);
cols[13] = float3(0.9348726, 0.3445304, 0.1259668);
cols[14] = float3(0.5252263, 0.6406747, 0.5291851);
cols[15] = float3(0.5737085, 0.7510649, 0.9684258);
cols[16] = float3(0.8309306, 0.9935759, 0.03933847);
cols[17] = float3(0.8015454, 0.2850359, 0.3424998);
cols[18] = float3(0.6500018, 0.3342113, 0.2114551);
cols[19] = float3(0.6989415, 0.5772225, 0.5919405);
cols[20] = float3(0.9995314, 0.03608966, 0.8069272);
cols[21] = float3(0.9686515, 0.5087866, 0.2795004);
cols[22] = float3(0.7633547, 0.3844915, 0.6364603);
cols[23] = float3(0.004937768, 0.9232857, 0.7564986);
cols[24] = float3(0.7366486, 0.04672933, 0.581704);
cols[25] = float3(0.679971, 0.9181976, 0.106493);
cols[26] = float3(0.757988, 0.1498725, 0.02522802);
cols[27] = float3(0.6075597, 0.2841853, 0.1913633);
cols[28] = float3(0.9076083, 0.3669905, 0.5986127);
cols[29] = float3(0.9096999, 0.2650028, 0.7824662);
cols[30] = float3(0.7939457, 0.5491059, 0.5917906);
cols[31] = float3(0.7344745, 0.2655312, 0.7513468);
cols[32] = float3(0.8140732, 0.5752077, 0.4256744);
cols[33] = float3(0.05977356, 0.7755806, 0.3207611);
cols[34] = float3(0.3828066, 0.3175365, 0.2667139);
cols[35] = float3(0.3283888, 0.923473, 0.9092711);
cols[36] = float3(0.9668199, 0.3348694, 0.5310941);
cols[37] = float3(0.8912607, 0.7498264, 0.7442385);
cols[38] = float3(0.1992081, 0.08653736, 0.008235455);
cols[39] = float3(0.8751887, 0.479202, 0.8267733);
cols[40] = float3(0.6194922, 0.2030482, 0.8045888);
cols[41] = float3(0.07886314, 0.6607696, 0.3226226);

				float3 col = float3(0., 0., 0.);
				
				float3 ro = float3(0., -1., -5.);
				float3 ta = float3(0., 0., 0.);
				float3 rd = normalize(ta-ro);
				
				rd = getCam(rd, uv);

				float3 res = trace(ro, rd, 128);
				if (res.y > 0.)
				{
					col = cols[int(res.z)];
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
