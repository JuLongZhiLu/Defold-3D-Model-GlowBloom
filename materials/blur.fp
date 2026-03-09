varying mediump vec2 var_texcoord0;

uniform lowp sampler2D tex0;
uniform vec4 resolution;

void main()
{
	// 每个像素的大小
	vec2 texelSize = 1.0 / resolution.xy;

	// 模糊强度，数值越大越模糊 (如果太大建议换成高斯模糊或分步模糊)
	float blur_radius = 2.0; 

	vec4 color = vec4(0.0);

	// 在当前像素周围 3x3 的范围内进行采样
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 offset = vec2(x, y) * texelSize * blur_radius;
			color += texture2D(tex0, var_texcoord0 + offset);
		}
	}

	// 取平均值
	color /= 9.0;

	gl_FragColor = color;
}