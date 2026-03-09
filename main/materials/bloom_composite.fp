varying mediump vec2 var_texcoord0;
uniform lowp sampler2D tex_main;  // 原图
uniform lowp sampler2D tex_bloom; // 模糊后的 Bloom 图
uniform mediump vec4 bloom_intensity; // x = 强度

void main()
{
	vec4 baseColor = texture2D(tex_main, var_texcoord0);
	vec4 bloomColor = texture2D(tex_bloom, var_texcoord0);

	// Additive 叠加
	gl_FragColor = baseColor + bloomColor * bloom_intensity.x;
}