Shader "Polish Builds/Example/Albedo Normal" // componet menu name
{
	//Input details
	Properties
	{
		_MainTex("Texture RGB",2D) = "white"{}
		_NormalMap("Normal Map",2D) = "bump"{}
	}

		//SHADER
		SubShader
	{
		Tags{"RenderType" = "Opaque"}


		//Render part Shader
		CGPROGRAM
		#pragma surface rendFunk Lambert //Lambert = diffuse (samething) no light just color
		struct Input //
		{
			float2 uv_MainTex;// is loke vecter2
			float2 uv_NormalMap;// is loke vecter2

		};
	//refrence to Input Properties 
	 sampler2D _MainTex;
	 sampler2D _NormalMap;


	 //render input for the _MainTex "Input" grab input , inout SurfaceOutput for showing to 
	 void rendFunk(Input inputInfo, inout SurfaceOutput outputInfo)
	 {
		 // show the image as Albedo = tex2D (textuermaterial  = maintextuer,uv for image) as rgb
									// tex2d inbuild in 2dShadrlanguse
		 outputInfo.Albedo = tex2D(_MainTex, inputInfo.uv_MainTex).rgb;
		 outputInfo.Normal = UnpackNormal(tex2D(_NormalMap, inputInfo.uv_NormalMap));
	 }
	 ENDCG
	}
		Fallback"Diffuse"
}