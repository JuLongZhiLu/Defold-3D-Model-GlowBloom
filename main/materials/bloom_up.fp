varying mediump vec2 var_texcoord0;
uniform lowp sampler2D texture_sampler;
uniform mediump vec4 resolution;

void main()
{
	vec2 uv = var_texcoord0;
	vec2 halfpixel = 0.5 / resolution.xy;

	vec4 sum = vec4(0.0);
	sum += texture2D(texture_sampler, uv + vec2(-halfpixel.x * 2.0, 0.0));
	sum += texture2D(texture_sampler, uv + vec2(-halfpixel.x, halfpixel.y)) * 2.0;
	sum += texture2D(texture_sampler, uv + vec2(0.0, halfpixel.y * 2.0));
	sum += texture2D(texture_sampler, uv + vec2(halfpixel.x, halfpixel.y)) * 2.0;
	sum += texture2D(texture_sampler, uv + vec2(halfpixel.x * 2.0, 0.0));
	sum += texture2D(texture_sampler, uv + vec2(halfpixel.x, -halfpixel.y)) * 2.0;
	sum += texture2D(texture_sampler, uv + vec2(0.0, -halfpixel.y * 2.0));
	sum += texture2D(texture_sampler, uv + vec2(-halfpixel.x, -halfpixel.y)) * 2.0;

	gl_FragColor = sum / 12.0;
}