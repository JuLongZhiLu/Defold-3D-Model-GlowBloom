varying mediump vec2 var_texcoord0;
uniform lowp sampler2D tex0;
uniform lowp vec4 tint; // 用于控制颜色和亮度倍率

void main()
{
	lowp vec4 color = texture2D(tex0, var_texcoord0) * tint;
	// 关键点：输出的 RGB 可以很大，配合 Alpha 实现发光感
	gl_FragColor = vec4(color.rgb, color.a);
}