Shader "Custom/Decal"
{
	Properties
	{
		_MainTex("Decal", 2D) = "white" {}
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" "Queue" = "Geometry+1" "ForceNoShadowCasting" = "true" }
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface decalRend Lambert decal:blend
		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};
		void decalRend(Input IN, inout SurfaceOutput o)
		{
			half4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
		FallBack "Diffuse"
}
