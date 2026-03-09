varying mediump vec2 var_texcoord0;
uniform lowp sampler2D tex0;
uniform lowp vec4 blur_dir; // x,y 存储模糊方向，如 (1,0) 或 (0,1)

void main() {
	lowp vec2 uv = var_texcoord0;
	lowp vec2 off = blur_dir.xy * 0.005; // 模糊半径
	lowp vec4 color = texture2D(tex0, uv) * 0.4;
	color += texture2D(tex0, uv + off) * 0.15;
	color += texture2D(tex0, uv - off) * 0.15;
	color += texture2D(tex0, uv + off * 2.0) * 0.15;
	color += texture2D(tex0, uv - off * 2.0) * 0.15;
	gl_FragColor = color;
}