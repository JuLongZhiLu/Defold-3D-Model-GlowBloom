// billboard.fp
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint; // 原生支持的 Tint 属性

void main()
{
	// 采样贴图颜色
	lowp vec4 color = texture2D(texture_sampler, var_texcoord0.xy);

	// 处理 Defold 预乘 Alpha 的 Tint
	lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);

	// 输出最终颜色
	gl_FragColor = color * tint_pm;
}