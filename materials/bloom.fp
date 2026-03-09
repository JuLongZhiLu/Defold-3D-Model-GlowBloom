varying mediump vec2 var_texcoord0;
uniform lowp sampler2D texture_sampler;
uniform mediump vec4 resolution; // 从 render script 传入

void main()
{
	vec2 uv = var_texcoord0;

	// 基础像素大小
	vec2 tex_offset = 1.0 / resolution.xy;

	// 光晕扩散半径 (数字越大光晕越宽，但性能和采样瑕疵会增加，通常2-4比较好)
	float radius = 3.0; 

	vec4 color = vec4(0.0);

	// 一个简单且性能相对较好的 9 采样高斯模糊变种
	color += texture2D(texture_sampler, uv) * 0.227027;
	color += texture2D(texture_sampler, uv + vec2( tex_offset.x * radius, 0.0)) * 0.1945946;
	color += texture2D(texture_sampler, uv + vec2(-tex_offset.x * radius, 0.0)) * 0.1945946;
	color += texture2D(texture_sampler, uv + vec2(0.0,  tex_offset.y * radius)) * 0.1945946;
	color += texture2D(texture_sampler, uv + vec2(0.0, -tex_offset.y * radius)) * 0.1945946;
	color += texture2D(texture_sampler, uv + vec2( tex_offset.x * radius,  tex_offset.y * radius)) * 0.0486486;
	color += texture2D(texture_sampler, uv + vec2(-tex_offset.x * radius,  tex_offset.y * radius)) * 0.0486486;
	color += texture2D(texture_sampler, uv + vec2( tex_offset.x * radius, -tex_offset.y * radius)) * 0.0486486;
	color += texture2D(texture_sampler, uv + vec2(-tex_offset.x * radius, -tex_offset.y * radius)) * 0.0486486;

	// 提升亮度 (Multiplier)，让光晕更亮更显眼，可以自己微调 1.5 到 3.0
	gl_FragColor = color * 2.0;
}