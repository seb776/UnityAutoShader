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

				acc = _min(acc, float2(length(p-float3(1.058383, 1.43021, 0.1094437)) - 1.314361, 0.));
acc = _min(acc, float2(length(p-float3(-2.781419, 4.868384, 3.455228)) - 0.4270529, 1.));
acc = _min(acc, float2(length(p-float3(-4.069344, -4.427225, 4.042181)) - 1.599354, 2.));
acc = _min(acc, float2(length(p-float3(2.386715, 2.942178, 2.388142)) - 1.677387, 3.));
acc = _min(acc, float2(length(p-float3(3.073119, 4.421697, 2.743168)) - 1.941191, 4.));
acc = _min(acc, float2(length(p-float3(4.913469, 3.253341, 3.89222)) - 0.2269497, 5.));
acc = _min(acc, float2(length(p-float3(0.01528931, 2.495093, 4.946385)) - 0.3618474, 6.));
acc = _min(acc, float2(length(p-float3(4.251338, -0.3461547, 0.3000188)) - 0.5941561, 7.));
acc = _min(acc, float2(length(p-float3(-2.828991, -2.292459, 0.2772337)) - 0.9673421, 8.));
acc = _min(acc, float2(length(p-float3(2.753509, -1.252462, 1.136932)) - 1.9873, 9.));
acc = _min(acc, float2(length(p-float3(-2.146792, 2.926128, 1.745191)) - 0.340553, 10.));
acc = _min(acc, float2(length(p-float3(-3.472925, -4.867578, 3.632807)) - 1.726943, 11.));
acc = _min(acc, float2(length(p-float3(0.1838427, 1.260066, 2.463162)) - 0.8465169, 12.));
acc = _min(acc, float2(length(p-float3(-3.369766, -0.9788303, 0.1293933)) - 0.6655853, 13.));
acc = _min(acc, float2(length(p-float3(4.578285, 0.7058997, 2.263084)) - 1.187481, 14.));
acc = _min(acc, float2(length(p-float3(0.980783, -2.878654, 2.017736)) - 1.163706, 15.));
acc = _min(acc, float2(length(p-float3(4.625063, 3.766828, 2.125185)) - 0.7182502, 16.));
acc = _min(acc, float2(length(p-float3(-1.196204, -0.8094244, 1.355307)) - 0.1672875, 17.));
acc = _min(acc, float2(length(p-float3(4.611547, -4.438305, 4.025628)) - 1.867024, 18.));
acc = _min(acc, float2(length(p-float3(-0.365643, -3.172818, 3.385863)) - 1.410403, 19.));
acc = _min(acc, float2(length(p-float3(4.462829, -4.956101, 4.53664)) - 0.414692, 20.));
acc = _min(acc, float2(length(p-float3(4.763088, -2.342077, 3.009875)) - 0.2576274, 21.));
acc = _min(acc, float2(length(p-float3(4.315043, -0.2125568, 2.671429)) - 0.2126398, 22.));
acc = _min(acc, float2(length(p-float3(2.010985, -3.395324, 4.874897)) - 0.1480864, 23.));
acc = _min(acc, float2(length(p-float3(-2.278814, -4.684364, 0.11796)) - 0.7740048, 24.));
acc = _min(acc, float2(length(p-float3(-2.472927, 2.660863, 1.518206)) - 1.369981, 25.));
acc = _min(acc, float2(length(p-float3(-4.287668, -1.721849, 2.586143)) - 1.299849, 26.));
acc = _min(acc, float2(length(p-float3(-4.424341, 1.684666, 3.305017)) - 0.8637853, 27.));
acc = _min(acc, float2(length(p-float3(3.935516, -4.702177, 0.02500296)) - 1.460922, 28.));
acc = _min(acc, float2(length(p-float3(-3.017503, -1.44438, 2.663839)) - 0.5224419, 29.));
acc = _min(acc, float2(length(p-float3(1.400452, 4.442187, 4.10826)) - 0.9909773, 30.));
acc = _min(acc, float2(length(p-float3(1.30398, 4.878277, 2.433206)) - 1.568505, 31.));
acc = _min(acc, float2(length(p-float3(-4.914476, 1.511724, 0.7891035)) - 1.251966, 32.));
acc = _min(acc, float2(length(p-float3(0.4023213, 2.509868, 0.293743)) - 0.4436173, 33.));
acc = _min(acc, float2(length(p-float3(3.117907, 2.865478, 3.21089)) - 0.7323922, 34.));
acc = _min(acc, float2(length(p-float3(-1.143975, -0.7315202, 1.520741)) - 0.767698, 35.));
acc = _min(acc, float2(length(p-float3(3.383866, 0.09688091, 0.01539111)) - 1.1625, 36.));
acc = _min(acc, float2(length(p-float3(2.714524, 1.249633, 3.073759)) - 0.6798663, 37.));
acc = _min(acc, float2(length(p-float3(3.916076, 2.451711, 1.240501)) - 1.211884, 38.));
acc = _min(acc, float2(length(p-float3(3.599957, -2.922577, 4.260283)) - 0.3337662, 39.));
acc = _min(acc, float2(length(p-float3(1.052163, -2.463583, 1.139778)) - 1.16165, 40.));
acc = _min(acc, float2(length(p-float3(1.660308, -3.438601, 2.588954)) - 0.5874659, 41.));
acc = _min(acc, float2(length(p-float3(-2.099588, 1.570516, 2.927445)) - 1.921901, 42.));
acc = _min(acc, float2(length(p-float3(-1.522121, 3.359364, 1.049522)) - 0.5332472, 43.));
acc = _min(acc, float2(length(p-float3(2.322006, -3.69482, 1.55544)) - 1.140308, 44.));
acc = _min(acc, float2(length(p-float3(-2.713699, 2.451119, 3.936098)) - 0.3456926, 45.));
acc = _min(acc, float2(length(p-float3(-1.921196, 4.572174, 3.605537)) - 0.3776981, 46.));
acc = _min(acc, float2(length(p-float3(1.28818, -4.915159, 4.386677)) - 1.40691, 47.));
acc = _min(acc, float2(length(p-float3(2.04213, 0.767818, 1.024874)) - 0.8445649, 48.));
acc = _min(acc, float2(length(p-float3(-4.386024, -1.279401, 4.836257)) - 0.6455706, 49.));
acc = _min(acc, float2(length(p-float3(-0.5813723, -1.324374, 0.3209496)) - 1.048302, 50.));
acc = _min(acc, float2(length(p-float3(4.546274, 4.221097, 1.207577)) - 1.763343, 51.));
acc = _min(acc, float2(length(p-float3(-0.8184977, -1.151502, 3.117541)) - 0.9480875, 52.));
acc = _min(acc, float2(length(p-float3(0.608099, -0.3903227, 4.167303)) - 0.4837101, 53.));
acc = _min(acc, float2(length(p-float3(-0.04235554, -1.70715, 2.14695)) - 1.198394, 54.));
acc = _min(acc, float2(length(p-float3(-3.399248, -1.659115, 0.5725956)) - 0.9870016, 55.));
acc = _min(acc, float2(length(p-float3(-2.122809, 2.46471, 1.564513)) - 0.5360293, 56.));
acc = _min(acc, float2(length(p-float3(3.4481, 1.03828, 0.2769834)) - 0.5627435, 57.));
acc = _min(acc, float2(length(p-float3(-4.071188, 2.932115, 3.844917)) - 0.1040346, 58.));
acc = _min(acc, float2(length(p-float3(2.388159, 3.245164, 2.84046)) - 0.2123458, 59.));
acc = _min(acc, float2(length(p-float3(-0.1843352, -3.882511, 0.6916493)) - 1.149263, 60.));
acc = _min(acc, float2(length(p-float3(4.184609, 3.317501, 4.27001)) - 1.585833, 61.));
acc = _min(acc, float2(length(p-float3(-0.1785903, 4.497715, 2.724929)) - 1.292229, 62.));
acc = _min(acc, float2(length(p-float3(-2.681154, -1.190775, 0.6272399)) - 0.9387968, 63.));
acc = _min(acc, float2(length(p-float3(-4.624986, -3.876034, 3.256547)) - 0.231736, 64.));
acc = _min(acc, float2(length(p-float3(-2.566037, -1.10308, 1.586556)) - 1.800819, 65.));
acc = _min(acc, float2(length(p-float3(-4.505324, 0.2892656, 3.657064)) - 1.933204, 66.));
acc = _min(acc, float2(length(p-float3(0.4878421, 3.578251, 2.525539)) - 1.945073, 67.));
acc = _min(acc, float2(length(p-float3(-4.460638, 4.967056, 2.10415)) - 0.6044208, 68.));
acc = _min(acc, float2(length(p-float3(-0.3865452, -0.01369667, 0.7475525)) - 0.456505, 69.));
acc = _min(acc, float2(length(p-float3(-2.581712, -0.1280446, 0.9377307)) - 1.776187, 70.));
acc = _min(acc, float2(length(p-float3(-3.822547, -3.732285, 4.29024)) - 1.277619, 71.));
acc = _min(acc, float2(length(p-float3(-2.563037, 0.08726406, 2.268698)) - 1.709509, 72.));
acc = _min(acc, float2(length(p-float3(3.592692, 3.568697, 3.117026)) - 0.7885333, 73.));
acc = _min(acc, float2(length(p-float3(-3.124255, -4.903899, 0.8605337)) - 0.3348495, 74.));
acc = _min(acc, float2(length(p-float3(1.884331, 3.534298, 1.786746)) - 0.6589782, 75.));
acc = _min(acc, float2(length(p-float3(0.2841167, -4.356605, 2.903445)) - 0.6509328, 76.));
acc = _min(acc, float2(length(p-float3(-0.7470183, 1.480123, 1.0326)) - 1.846827, 77.));
acc = _min(acc, float2(length(p-float3(-0.1680036, -3.149641, 2.375033)) - 0.6973063, 78.));
acc = _min(acc, float2(length(p-float3(-2.45789, -4.002968, 4.331382)) - 1.884535, 79.));
acc = _min(acc, float2(length(p-float3(1.840514, -0.4896135, 1.962038)) - 0.9049612, 80.));
acc = _min(acc, float2(length(p-float3(-4.829315, -0.5661387, 3.279616)) - 1.90919, 81.));
acc = _min(acc, float2(length(p-float3(3.924693, 4.205841, 4.595006)) - 1.198871, 82.));
acc = _min(acc, float2(length(p-float3(-3.418712, -2.6123, 3.591936)) - 0.2055581, 83.));
acc = _min(acc, float2(length(p-float3(4.18577, 1.392928, 3.018726)) - 1.673101, 84.));
acc = _min(acc, float2(length(p-float3(-1.134159, 2.819546, 1.723671)) - 0.6702163, 85.));
acc = _min(acc, float2(length(p-float3(-1.792049, -2.262114, 3.197813)) - 1.642303, 86.));
acc = _min(acc, float2(length(p-float3(0.5053611, 3.903918, 0.452345)) - 1.124225, 87.));
acc = _min(acc, float2(length(p-float3(-2.817317, 4.32939, 3.429987)) - 0.3551149, 88.));
acc = _min(acc, float2(length(p-float3(3.545326, -1.243811, 0.14108)) - 1.666937, 89.));
acc = _min(acc, float2(length(p-float3(0.7078295, -3.867263, 1.497851)) - 0.3341984, 90.));
acc = _min(acc, float2(length(p-float3(-1.671505, 0.6996293, 0.2650422)) - 1.674908, 91.));
acc = _min(acc, float2(length(p-float3(-0.2634687, 3.998512, 0.545435)) - 0.6353773, 92.));
acc = _min(acc, float2(length(p-float3(3.694944, -1.674325, 3.352428)) - 0.8229899, 93.));
acc = _min(acc, float2(length(p-float3(-0.5028982, -3.407726, 2.500448)) - 1.718015, 94.));
acc = _min(acc, float2(length(p-float3(-2.695173, 1.797635, 3.707796)) - 0.8161515, 95.));
acc = _min(acc, float2(length(p-float3(2.981951, -2.130387, 2.014706)) - 1.205001, 96.));
acc = _min(acc, float2(length(p-float3(-3.236749, -3.214586, 1.865763)) - 0.6550777, 97.));
acc = _min(acc, float2(length(p-float3(0.8980103, -3.255923, 2.664207)) - 1.646379, 98.));
acc = _min(acc, float2(length(p-float3(-1.754312, 0.2937655, 3.020469)) - 0.9543737, 99.));
acc = _min(acc, float2(length(p-float3(0.48559, 3.416475, 1.202495)) - 0.8963396, 100.));
acc = _min(acc, float2(length(p-float3(-1.485007, -3.176347, 1.791507)) - 0.1077766, 101.));
acc = _min(acc, float2(length(p-float3(-3.740961, -3.993139, 3.535857)) - 1.180985, 102.));
acc = _min(acc, float2(length(p-float3(-4.08586, 3.958601, 0.2193081)) - 1.790701, 103.));
acc = _min(acc, float2(length(p-float3(-2.795508, 0.6092029, 4.887791)) - 1.050611, 104.));
acc = _min(acc, float2(length(p-float3(-1.711814, -2.262135, 3.922107)) - 1.862455, 105.));
acc = _min(acc, float2(length(p-float3(-3.271643, 3.224831, 3.406928)) - 0.4148548, 106.));
acc = _min(acc, float2(length(p-float3(-4.398284, -4.916772, 1.751783)) - 1.409021, 107.));
acc = _min(acc, float2(length(p-float3(0.8363862, 4.281096, 1.516223)) - 1.272172, 108.));
acc = _min(acc, float2(length(p-float3(-4.891544, -1.883464, 3.499619)) - 0.185497, 109.));
acc = _min(acc, float2(length(p-float3(-3.634967, -2.655151, 2.329368)) - 1.724443, 110.));
acc = _min(acc, float2(length(p-float3(-4.109085, -0.5641155, 3.097977)) - 1.256539, 111.));
acc = _min(acc, float2(length(p-float3(-1.244556, 2.091557, 1.231098)) - 0.9248466, 112.));
acc = _min(acc, float2(length(p-float3(-3.154235, -4.124968, 0.6213933)) - 0.8527943, 113.));
acc = _min(acc, float2(length(p-float3(-1.723749, 2.25369, 2.337001)) - 1.01522, 114.));
acc = _min(acc, float2(length(p-float3(2.950435, 4.095247, 1.697876)) - 0.5764547, 115.));
acc = _min(acc, float2(length(p-float3(4.417807, 4.609379, 2.13429)) - 1.734198, 116.));
acc = _min(acc, float2(length(p-float3(0.2748542, -4.466376, 2.26724)) - 0.7929171, 117.));
acc = _min(acc, float2(length(p-float3(-1.387786, -4.645581, 0.001271963)) - 1.170427, 118.));
acc = _min(acc, float2(length(p-float3(1.501996, -4.554628, 3.320626)) - 1.648587, 119.));
acc = _min(acc, float2(length(p-float3(-0.7859116, -2.796612, 2.867586)) - 1.391936, 120.));
acc = _min(acc, float2(length(p-float3(-1.216157, 1.866182, 3.902075)) - 0.7762152, 121.));
acc = _min(acc, float2(length(p-float3(-2.331536, -0.1657815, 1.40239)) - 0.9341135, 122.));
acc = _min(acc, float2(length(p-float3(-4.21986, 2.254956, 4.674609)) - 1.662139, 123.));
acc = _min(acc, float2(length(p-float3(-4.679461, -3.13089, 0.7585192)) - 0.9237136, 124.));
acc = _min(acc, float2(length(p-float3(2.521356, -4.552181, 1.36109)) - 0.1294943, 125.));
acc = _min(acc, float2(length(p-float3(4.184627, -4.304409, 3.472129)) - 1.985287, 126.));
acc = _min(acc, float2(length(p-float3(-1.366174, 2.413579, 0.9595621)) - 1.442898, 127.));
acc = _min(acc, float2(length(p-float3(-1.27319, 2.687109, 1.191291)) - 1.826937, 128.));
acc = _min(acc, float2(length(p-float3(-0.8597131, 0.4227777, 0.9192657)) - 1.334566, 129.));
acc = _min(acc, float2(length(p-float3(3.074869, 4.198588, 1.563388)) - 1.338075, 130.));
acc = _min(acc, float2(length(p-float3(-0.4772444, -4.403176, 0.4402572)) - 1.292547, 131.));
acc = _min(acc, float2(length(p-float3(2.559206, -3.889466, 2.554163)) - 0.6951188, 132.));
acc = _min(acc, float2(length(p-float3(-2.079961, 2.109444, 1.922488)) - 0.7075366, 133.));
acc = _min(acc, float2(length(p-float3(2.991179, 0.5292277, 0.9194446)) - 0.530885, 134.));
acc = _min(acc, float2(length(p-float3(4.231464, 4.903412, 1.469368)) - 1.649616, 135.));
acc = _min(acc, float2(length(p-float3(-4.510941, -0.348237, 1.213456)) - 1.731448, 136.));
acc = _min(acc, float2(length(p-float3(4.825257, -2.145699, 0.9705156)) - 1.046323, 137.));
acc = _min(acc, float2(length(p-float3(4.121789, 2.641672, 2.680251)) - 0.5805085, 138.));
acc = _min(acc, float2(length(p-float3(-0.8146005, -2.661197, 2.105155)) - 0.3525659, 139.));
acc = _min(acc, float2(length(p-float3(3.662426, 2.227598, 3.88827)) - 1.93013, 140.));
acc = _min(acc, float2(length(p-float3(-1.129151, -3.097211, 0.4697949)) - 0.9557873, 141.));
acc = _min(acc, float2(length(p-float3(-1.94463, 1.108921, 1.996149)) - 0.5798895, 142.));
acc = _min(acc, float2(length(p-float3(1.867721, 3.317541, 3.751876)) - 1.154067, 143.));
acc = _min(acc, float2(length(p-float3(-0.1148267, -2.757226, 2.310441)) - 1.539956, 144.));
acc = _min(acc, float2(length(p-float3(-3.137552, 2.085258, 3.650766)) - 1.506417, 145.));
acc = _min(acc, float2(length(p-float3(-2.559965, -4.963846, 3.419595)) - 0.4415007, 146.));
acc = _min(acc, float2(length(p-float3(4.923739, 2.737942, 2.543142)) - 1.380693, 147.));
acc = _min(acc, float2(length(p-float3(3.65871, -3.279404, 0.0474)) - 1.93313, 148.));
acc = _min(acc, float2(length(p-float3(-3.931591, -2.739157, 2.794665)) - 0.3252596, 149.));
acc = _min(acc, float2(length(p-float3(0.948184, 0.5724697, 1.293738)) - 0.1546342, 150.));
acc = _min(acc, float2(length(p-float3(1.940966, -4.190997, 2.666723)) - 1.532091, 151.));
acc = _min(acc, float2(length(p-float3(4.544498, 0.5381484, 1.777055)) - 0.8214137, 152.));
acc = _min(acc, float2(length(p-float3(0.4147501, 4.512339, 4.623301)) - 1.116465, 153.));
acc = _min(acc, float2(length(p-float3(-2.076787, -0.2075295, 3.787671)) - 1.036933, 154.));
acc = _min(acc, float2(length(p-float3(-0.8794646, 1.906675, 2.568459)) - 0.4199467, 155.));
acc = _min(acc, float2(length(p-float3(1.32369, 0.9686775, 4.404804)) - 0.8831151, 156.));
acc = _min(acc, float2(length(p-float3(-2.076218, -1.145861, 0.6042224)) - 1.570062, 157.));
acc = _min(acc, float2(length(p-float3(4.668325, -4.798221, 4.151922)) - 1.614892, 158.));
acc = _min(acc, float2(length(p-float3(0.82761, 2.579599, 3.342464)) - 0.5872267, 159.));
acc = _min(acc, float2(length(p-float3(2.045736, 4.546576, 3.019211)) - 1.523688, 160.));
acc = _min(acc, float2(length(p-float3(4.537949, 4.293924, 2.190877)) - 1.276985, 161.));
acc = _min(acc, float2(length(p-float3(3.336847, -2.085046, 1.998151)) - 1.949906, 162.));
acc = _min(acc, float2(length(p-float3(-2.781022, -4.873167, 1.323924)) - 0.3564991, 163.));
acc = _min(acc, float2(length(p-float3(2.8929, 2.862116, 3.098603)) - 1.890712, 164.));
acc = _min(acc, float2(length(p-float3(3.139546, -3.855604, 2.070956)) - 0.192922, 165.));
acc = _min(acc, float2(length(p-float3(1.454216, -3.40132, 0.3780383)) - 1.832763, 166.));
acc = _min(acc, float2(length(p-float3(-2.91044, 0.09141874, 0.9402239)) - 1.750962, 167.));
acc = _min(acc, float2(length(p-float3(-1.37595, -3.872672, 0.3220356)) - 1.747405, 168.));
acc = _min(acc, float2(length(p-float3(-4.92658, -0.9241195, 2.587446)) - 0.4737861, 169.));
acc = _min(acc, float2(length(p-float3(-3.277974, -4.91828, 2.327828)) - 0.9891698, 170.));
acc = _min(acc, float2(length(p-float3(-2.349095, -0.205018, 3.016034)) - 1.945258, 171.));
acc = _min(acc, float2(length(p-float3(-0.01517582, -2.146163, 3.56954)) - 1.0515, 172.));
acc = _min(acc, float2(length(p-float3(-0.1562839, -2.284339, 3.211977)) - 0.8593258, 173.));
acc = _min(acc, float2(length(p-float3(1.580391, -0.6837673, 3.483084)) - 0.8732518, 174.));
acc = _min(acc, float2(length(p-float3(-3.525496, 3.005861, 0.3874063)) - 0.4459093, 175.));
acc = _min(acc, float2(length(p-float3(-4.615194, -2.661819, 0.7497746)) - 0.3531564, 176.));
acc = _min(acc, float2(length(p-float3(-0.9098034, -3.597293, 4.593802)) - 1.790604, 177.));
acc = _min(acc, float2(length(p-float3(3.753271, -3.205022, 0.2446026)) - 1.722789, 178.));
acc = _min(acc, float2(length(p-float3(-4.59576, 4.223681, 1.446953)) - 1.933836, 179.));
acc = _min(acc, float2(length(p-float3(-4.815016, 0.2953095, 2.356452)) - 1.629547, 180.));
acc = _min(acc, float2(length(p-float3(-4.608242, -1.122244, 0.6181806)) - 0.2200018, 181.));
acc = _min(acc, float2(length(p-float3(0.2033706, 0.1241941, 0.340457)) - 1.775174, 182.));
acc = _min(acc, float2(length(p-float3(-0.5157967, -2.480169, 1.68823)) - 0.7585844, 183.));
acc = _min(acc, float2(length(p-float3(4.792257, -2.675096, 1.210399)) - 1.029769, 184.));
acc = _min(acc, float2(length(p-float3(1.344019, 2.69425, 1.057374)) - 0.9378802, 185.));
acc = _min(acc, float2(length(p-float3(-1.056094, -2.620052, 2.881214)) - 0.9452583, 186.));
acc = _min(acc, float2(length(p-float3(4.140607, 2.252236, 4.199617)) - 1.825266, 187.));
acc = _min(acc, float2(length(p-float3(-4.269691, -4.644583, 0.9090841)) - 1.988337, 188.));
acc = _min(acc, float2(length(p-float3(1.508101, -3.057264, 4.862941)) - 0.3062784, 189.));
acc = _min(acc, float2(length(p-float3(4.923396, 1.38311, 2.738847)) - 0.5472359, 190.));
acc = _min(acc, float2(length(p-float3(-3.033786, -0.5575843, 3.490894)) - 0.6887454, 191.));
acc = _min(acc, float2(length(p-float3(-2.138594, 4.367902, 3.703833)) - 0.2694501, 192.));
acc = _min(acc, float2(length(p-float3(0.6268497, -1.728716, 1.618474)) - 0.7136939, 193.));
acc = _min(acc, float2(length(p-float3(-3.539052, 2.461325, 2.067536)) - 1.038669, 194.));
acc = _min(acc, float2(length(p-float3(0.4445596, -1.670429, 4.177255)) - 0.127796, 195.));
acc = _min(acc, float2(length(p-float3(-4.355858, -1.652644, 4.870415)) - 0.5733409, 196.));
acc = _min(acc, float2(length(p-float3(-0.448132, -0.9200211, 2.921729)) - 1.551524, 197.));
acc = _min(acc, float2(length(p-float3(3.386309, -0.2160759, 4.109265)) - 1.432826, 198.));
acc = _min(acc, float2(length(p-float3(-3.255739, -3.457266, 3.956338)) - 1.656393, 199.));


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
				float3 cols[200];
cols[0] = float3(0.1689844, 0.7135948, 0.8490185);
cols[1] = float3(0.7931395, 0.9493285, 0.475709);
cols[2] = float3(0.02802253, 0.05601823, 0.8217114);
cols[3] = float3(0.01562047, 0.8673898, 0.2728032);
cols[4] = float3(0.3909324, 0.02343273, 0.8855531);
cols[5] = float3(0.06648076, 0.9532042, 0.5717707);
cols[6] = float3(0.4468046, 0.8014555, 0.5477486);
cols[7] = float3(0.6053503, 0.03472924, 0.3680492);
cols[8] = float3(0.851566, 0.2126056, 0.4835176);
cols[9] = float3(0.5102738, 0.51953, 0.5311703);
cols[10] = float3(0.875376, 0.5245067, 0.5916309);
cols[11] = float3(0.9098383, 0.4371268, 0.8609765);
cols[12] = float3(0.8000665, 0.7656127, 0.06488609);
cols[13] = float3(0.3212901, 0.08242178, 0.2661986);
cols[14] = float3(0.758943, 0.5545688, 0.07264578);
cols[15] = float3(0.03294218, 0.04031718, 0.5696153);
cols[16] = float3(0.1180508, 0.3938923, 0.4422166);
cols[17] = float3(0.5653685, 0.3745765, 0.1689123);
cols[18] = float3(0.0157609, 0.6033575, 0.7508011);
cols[19] = float3(0.3485257, 0.7195095, 0.5163262);
cols[20] = float3(0.36452, 0.4921028, 0.9478579);
cols[21] = float3(0.4534562, 0.7096399, 0.09778976);
cols[22] = float3(0.6502596, 0.5462335, 0.1747203);
cols[23] = float3(0.7782791, 0.2528986, 0.2941769);
cols[24] = float3(0.2796248, 0.1118566, 0.4268698);
cols[25] = float3(0.4883628, 0.5671142, 0.1709106);
cols[26] = float3(0.869606, 0.8897182, 0.5492988);
cols[27] = float3(0.5207915, 0.39149, 0.5565737);
cols[28] = float3(0.9112681, 0.6193854, 0.3143116);
cols[29] = float3(0.8116618, 0.1791387, 0.6772438);
cols[30] = float3(0.3412939, 0.1411835, 0.01639509);
cols[31] = float3(0.4142466, 0.003468752, 0.360126);
cols[32] = float3(0.03864169, 0.8621238, 0.7471824);
cols[33] = float3(0.1297646, 0.1355829, 0.3799363);
cols[34] = float3(0.5598281, 0.7296692, 0.3792655);
cols[35] = float3(0.1630057, 0.6140916, 0.1614367);
cols[36] = float3(0.77096, 0.461162, 0.5214285);
cols[37] = float3(0.3861923, 0.03355539, 0.7147902);
cols[38] = float3(0.6475222, 0.2753618, 0.8674765);
cols[39] = float3(0.4578888, 0.9724326, 0.7278464);
cols[40] = float3(0.376911, 0.6297947, 0.4039671);
cols[41] = float3(0.6752467, 0.4885741, 0.6807786);
cols[42] = float3(0.4640287, 0.9687352, 0.1440442);
cols[43] = float3(0.373659, 0.7171336, 0.5511376);
cols[44] = float3(0.07720077, 0.2126958, 0.01351905);
cols[45] = float3(0.5107821, 0.9548172, 0.802761);
cols[46] = float3(0.1053461, 0.680384, 0.6805278);
cols[47] = float3(0.5793499, 0.6496434, 0.9377035);
cols[48] = float3(0.6257001, 0.3396413, 0.4528347);
cols[49] = float3(0.9497205, 0.7936243, 0.8915604);
cols[50] = float3(0.3462269, 0.3378764, 0.5869423);
cols[51] = float3(0.6438192, 0.2978083, 0.3690915);
cols[52] = float3(0.422914, 0.7044169, 0.8128637);
cols[53] = float3(0.3990536, 0.02514732, 0.8788421);
cols[54] = float3(0.8460667, 0.5046343, 0.220562);
cols[55] = float3(0.5533759, 0.3008689, 0.4702109);
cols[56] = float3(0.2464116, 0.8291903, 0.06574976);
cols[57] = float3(0.009235501, 0.2667417, 0.3984435);
cols[58] = float3(0.7012938, 0.3962943, 0.9945201);
cols[59] = float3(0.3308838, 0.06430829, 0.5867022);
cols[60] = float3(0.2962077, 0.6307062, 0.2020416);
cols[61] = float3(0.2374562, 0.7313428, 0.6397811);
cols[62] = float3(0.5642437, 0.326438, 0.9363467);
cols[63] = float3(0.7464932, 0.7068207, 0.4649294);
cols[64] = float3(0.7191697, 0.2387191, 0.9742448);
cols[65] = float3(0.4784227, 0.2170867, 0.9173565);
cols[66] = float3(0.3659371, 0.6133199, 0.8133751);
cols[67] = float3(0.7958273, 0.1616602, 0.7754018);
cols[68] = float3(0.5774285, 0.7941331, 0.05500662);
cols[69] = float3(0.8492907, 0.5197839, 0.8438404);
cols[70] = float3(0.2813147, 0.8257979, 0.7797304);
cols[71] = float3(0.4791796, 0.792358, 0.8940527);
cols[72] = float3(0.08053458, 0.5700297, 0.2918275);
cols[73] = float3(0.861725, 0.7498873, 0.2067966);
cols[74] = float3(0.8641479, 0.3717352, 0.7402387);
cols[75] = float3(0.7457968, 0.9629618, 0.8477849);
cols[76] = float3(0.5695886, 0.8273666, 0.06292868);
cols[77] = float3(0.6832019, 0.9802293, 0.3969722);
cols[78] = float3(0.4225641, 0.971573, 0.812886);
cols[79] = float3(0.9512559, 0.2760121, 0.6610631);
cols[80] = float3(0.8284063, 0.9044168, 0.3759629);
cols[81] = float3(0.6008323, 0.040887, 0.981105);
cols[82] = float3(0.3560991, 0.432599, 0.1232015);
cols[83] = float3(0.8195374, 0.5406293, 0.2270408);
cols[84] = float3(0.2619117, 0.4735803, 0.7651038);
cols[85] = float3(0.1228563, 0.08281827, 0.1164929);
cols[86] = float3(0.4080705, 0.2608196, 0.01975155);
cols[87] = float3(0.5950307, 0.5471174, 0.4375846);
cols[88] = float3(0.8608943, 0.9846902, 0.1765639);
cols[89] = float3(0.8721734, 0.2828419, 0.5126402);
cols[90] = float3(0.6465535, 0.3063273, 0.8217829);
cols[91] = float3(0.9883282, 0.7345101, 0.1700467);
cols[92] = float3(0.1726482, 0.4169456, 0.7577101);
cols[93] = float3(0.6541959, 0.105323, 0.8381039);
cols[94] = float3(0.6372524, 0.6601348, 0.8009901);
cols[95] = float3(0.9128011, 0.2339361, 0.2402512);
cols[96] = float3(0.07185268, 0.5285965, 0.1200377);
cols[97] = float3(0.3393845, 0.1009409, 0.9990822);
cols[98] = float3(0.9475247, 0.8502593, 0.2692677);
cols[99] = float3(0.4211041, 0.7098427, 0.8650377);
cols[100] = float3(0.08293355, 0.1581476, 0.4839395);
cols[101] = float3(0.2031587, 0.9364061, 0.8771876);
cols[102] = float3(0.2971643, 0.9576334, 0.2590916);
cols[103] = float3(0.9835784, 0.770396, 0.6626128);
cols[104] = float3(0.3199459, 0.8518248, 0.08653605);
cols[105] = float3(0.9184121, 0.7288251, 0.9553857);
cols[106] = float3(0.32467, 0.0324086, 0.220789);
cols[107] = float3(0.2538317, 0.8507494, 0.2979299);
cols[108] = float3(0.9295763, 0.632445, 0.1596354);
cols[109] = float3(0.8340251, 0.8100901, 0.3152794);
cols[110] = float3(0.905672, 0.01401591, 0.4731074);
cols[111] = float3(0.2777095, 0.07891488, 0.7799467);
cols[112] = float3(0.802318, 0.7317418, 0.6869569);
cols[113] = float3(0.6927634, 0.7904969, 0.4335068);
cols[114] = float3(0.8698853, 0.2463547, 0.7567571);
cols[115] = float3(0.9074267, 0.9907713, 0.8077452);
cols[116] = float3(0.4750184, 0.2497596, 0.3752357);
cols[117] = float3(0.1275061, 0.6524843, 0.7876673);
cols[118] = float3(0.948244, 0.3911012, 0.9155787);
cols[119] = float3(0.4606918, 0.2594793, 0.1732734);
cols[120] = float3(0.932737, 0.1829438, 0.07793677);
cols[121] = float3(0.5818365, 0.7688546, 0.7151473);
cols[122] = float3(0.2726503, 0.4883006, 0.4253224);
cols[123] = float3(0.7356657, 0.8263187, 0.5502655);
cols[124] = float3(0.4759242, 0.2972317, 0.7109591);
cols[125] = float3(0.9500225, 0.009935617, 0.7022482);
cols[126] = float3(0.6685475, 0.407149, 0.3149914);
cols[127] = float3(0.6027337, 0.3055457, 0.3517542);
cols[128] = float3(0.1498318, 0.4333535, 0.3960503);
cols[129] = float3(0.06273091, 0.6995466, 0.8527236);
cols[130] = float3(0.2904083, 0.2579817, 0.09661233);
cols[131] = float3(0.4308699, 0.2039872, 0.91229);
cols[132] = float3(0.7085378, 0.3208802, 0.8983395);
cols[133] = float3(0.669571, 0.7577667, 0.2026983);
cols[134] = float3(0.5062771, 0.6113387, 0.3519474);
cols[135] = float3(0.2096692, 0.96472, 0.5066171);
cols[136] = float3(0.1637663, 0.1707374, 0.3438353);
cols[137] = float3(0.38362, 0.4162524, 0.9050219);
cols[138] = float3(0.4149583, 0.738636, 0.7614872);
cols[139] = float3(0.8581744, 0.5449314, 0.5551535);
cols[140] = float3(0.08914411, 0.4237258, 0.5998845);
cols[141] = float3(0.8775403, 0.8147956, 0.8335971);
cols[142] = float3(0.2132906, 0.2226641, 0.381426);
cols[143] = float3(0.3314846, 0.5252134, 0.366114);
cols[144] = float3(0.07604825, 0.3734587, 0.2476442);
cols[145] = float3(0.3625194, 0.08512342, 0.3817708);
cols[146] = float3(0.356417, 0.6405537, 0.1905987);
cols[147] = float3(0.04224777, 0.686972, 0.4118599);
cols[148] = float3(0.4304312, 0.448165, 0.5433421);
cols[149] = float3(0.9681163, 0.3008892, 0.5497198);
cols[150] = float3(0.8722014, 0.1741467, 0.0638628);
cols[151] = float3(0.3388411, 0.7433664, 0.8487701);
cols[152] = float3(0.3188546, 0.4733852, 0.7857112);
cols[153] = float3(0.7536308, 0.9720795, 0.8743626);
cols[154] = float3(0.4610047, 0.5574228, 0.05588412);
cols[155] = float3(0.594415, 0.9737198, 0.8743092);
cols[156] = float3(0.1717104, 0.4255753, 0.258931);
cols[157] = float3(0.2775931, 0.716746, 0.4293595);
cols[158] = float3(0.08337438, 0.6083086, 0.8237072);
cols[159] = float3(0.9454068, 0.5367633, 0.1973675);
cols[160] = float3(0.5253995, 0.4014708, 0.56339);
cols[161] = float3(0.8158891, 0.32226, 0.4584923);
cols[162] = float3(0.7781757, 0.2657388, 0.06087661);
cols[163] = float3(0.6704549, 0.9157308, 0.5002899);
cols[164] = float3(0.8901025, 0.7357166, 0.1544093);
cols[165] = float3(0.9708887, 0.3221973, 0.2148504);
cols[166] = float3(0.2975256, 0.5254731, 0.08980799);
cols[167] = float3(0.4390263, 0.0654943, 0.177115);
cols[168] = float3(0.7050507, 0.7750597, 0.3132817);
cols[169] = float3(0.9497304, 0.6979932, 0.6233417);
cols[170] = float3(0.881771, 0.5738565, 0.2846466);
cols[171] = float3(0.9946365, 0.3948733, 0.01377749);
cols[172] = float3(0.2269884, 0.8099617, 0.7939708);
cols[173] = float3(0.9810538, 0.1690415, 0.8725116);
cols[174] = float3(0.2989818, 0.664319, 0.2312654);
cols[175] = float3(0.01260781, 0.4686015, 0.03041279);
cols[176] = float3(0.003300428, 0.527821, 0.2742121);
cols[177] = float3(0.9271353, 0.582131, 0.1323769);
cols[178] = float3(0.6570536, 0.4144989, 0.3197238);
cols[179] = float3(0.5113595, 0.7912804, 0.9569912);
cols[180] = float3(0.9266496, 0.7455097, 0.1727033);
cols[181] = float3(0.1348175, 0.5304608, 0.04632461);
cols[182] = float3(0.5538254, 0.01438451, 0.5625618);
cols[183] = float3(0.6414776, 0.04181302, 0.07417357);
cols[184] = float3(0.7120161, 0.3639327, 0.2515621);
cols[185] = float3(0.6723049, 0.2729521, 0.0986923);
cols[186] = float3(0.3138127, 0.8439654, 0.04078758);
cols[187] = float3(0.1903985, 0.3879721, 0.6486765);
cols[188] = float3(0.1476494, 0.4202735, 0.3183358);
cols[189] = float3(0.7380728, 0.8433406, 0.8235435);
cols[190] = float3(0.4902989, 0.9283117, 0.3979735);
cols[191] = float3(0.9148463, 0.1973354, 0.3362553);
cols[192] = float3(0.200237, 0.06168342, 0.8785177);
cols[193] = float3(0.230848, 0.555358, 0.4231691);
cols[194] = float3(0.997833, 0.718038, 0.8560052);
cols[195] = float3(0.7919716, 0.1204789, 0.9185988);
cols[196] = float3(0.3541221, 0.4006607, 0.7031944);
cols[197] = float3(0.4584617, 0.8925204, 0.8303831);
cols[198] = float3(0.3188685, 0.2588822, 0.03774297);
cols[199] = float3(0.9988114, 0.881094, 0.1005242);

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