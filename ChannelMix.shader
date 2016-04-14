Shader "Effect/ChannelMix"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Red ("Red",Range(0,1)) = 1.0
		_Green ("Green",Range(0,1)) = 1.0
		_Blue ("Blue",Range(0,1)) = 1.0
	}
	SubShader
	{
		Pass
		{
			ZTest Always Cull Off
			ZWrite Off
			Fog {Mode off}

			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float _Red;
			float _Green;
			float _Blue;

			half4 frag (v2f_img IN):SV_Target
			{
				half4 col = tex2D(_MainTex,IN.uv);

				return half4(col.r * _Red,col.g * _Green,col.b * _Blue,col.a);
			}

			ENDCG
		}
	}
}
