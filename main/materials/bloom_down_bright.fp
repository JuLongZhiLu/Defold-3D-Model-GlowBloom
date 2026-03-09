varying mediump vec2 var_texcoord0;
uniform lowp sampler2D texture_sampler;
// resolution.x = width, resolution.y = height, resolution.z = threshold
uniform mediump vec4 resolution; 

void main()
{
	vec2 uv = var_texcoord0;
	vec2 offset = 1.0 / resolution.xy;

	// 4 Tap 采样 (利用硬件双线性插值)
	vec4 sum = texture2D(texture_sampler, uv + vec2(-offset.x, -offset.y));
	sum += texture2D(texture_sampler, uv + vec2(offset.x, -offset.y));
	sum += texture2D(texture_sampler, uv + vec2(-offset.x, offset.y));
	sum += texture2D(texture_sampler, uv + vec2(offset.x, offset.y));
	vec4 color = sum * 0.25;

	// 提取高光 (阈值提取)
	float threshold = resolution.z; // 比如传入 1.0
	float brightness = max(color.r, max(color.g, color.b));
	float contribution = max(0.0, brightness - threshold);

	// 保证不除以0
	brightness = max(brightness, 0.00001);
	gl_FragColor = color * (contribution / brightness);
}