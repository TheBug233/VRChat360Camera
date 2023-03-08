Shader "欧阳蓦然🍀/Dinocular3DPanoramic-Left"
{
	Properties
	{
		_Front ("Front [+Z]", 2D) = "white" {}
		_Back  ("Back [-Z]",  2D) = "white" {}
		_Left  ("Left [+X]",  2D) = "white" {}
		_Right ("Right [-X]", 2D) = "white" {}
		_Up    ("Up [+Y]",    2D) = "white" {}
		_Down  ("Down [-Y]",  2D) = "white" {}
		_Owner ("Owner Check", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Overlay+1" }
		LOD 100
		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite Off
		ZTest Off

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				float3 vp : TEXCOORD1;
			};

			sampler2D _Front, _Back, _Left, _Right, _Up, _Down;
			sampler2D _Owner;
			
v2f vert (appdata v)
{
    v2f o;
    float3 viewPos = mul(UNITY_MATRIX_MV, v.vertex).xyz;
    float fov = - UNITY_MATRIX_P[1][1];
    float ownerAlpha = tex2Dlod(_Owner, float4(0.5,0.5,0,0)).a;
    if(length(viewPos - float3(0,0,0)) > 0.5 || abs(fov - 1) < 0.001 || ownerAlpha < 0.5) o.vertex = 0;
    else o.vertex = float4(v.uv.x*2-1, 0-v.uv.y, 0, 1);
    o.uv = v.uv;
    o.vp = viewPos;
    return o;
}

			
			fixed4 frag (v2f i) : SV_Target
			{
				float theta = i.uv.x * 2 * 3.1415926535;
				float y = sin((i.uv.y * 2 - 1) * 3.1415926535 / 2);
				float3 dir = - float3(sin(theta), 0, cos(theta)) * sqrt(1 - y*y);
				dir.y = y;
				fixed4 col = float4(0,0,0,1);
				float3 aDir = abs(dir);
				float m = max(aDir.x, max(aDir.y, aDir.z));
				if(m == aDir.z) {
					if(dir.z > 0) {
						// Front
						float2 uv = dir.xy / dir.z * 0.5 + 0.5;
						col = tex2D(_Front, uv);
					} else {
						// Back
						float2 uv = - dir.xy * float2(-1,1) / dir.z * 0.5 + 0.5;
						col = tex2D(_Back, uv);
					}
				} else if(m == aDir.x) {
					if(dir.x > 0) {
						// Left
						float2 uv = dir.zy * float2(-1,1) / dir.x * 0.5 + 0.5;
						col = tex2D(_Left, uv);
					} else {
						// Right
						float2 uv = - dir.zy / dir.x * 0.5 + 0.5;
						col = tex2D(_Right, uv);
					}
				} else {
					if(dir.y > 0) {
						// Up
						float2 uv = dir.xz * float2(1,-1) / dir.y * 0.5 + 0.5;
						col = tex2D(_Up, uv);
					} else {
						// Down
						float2 uv = - dir.xz / dir.y * 0.5 + 0.5;
						col = tex2D(_Down, uv);
					}
				}
				col.a = 1;
				return col;
			}
			ENDCG
		}
	}
}
