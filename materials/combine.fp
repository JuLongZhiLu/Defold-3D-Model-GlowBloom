varying mediump vec2 var_texcoord0;
uniform lowp sampler2D tex_original; // 单元 0
uniform lowp sampler2D tex_bloom;    // 单元 1

void main() {
	lowp vec4 base = texture2D(tex_original, var_texcoord0);
	lowp vec4 bloom = texture2D(tex_bloom, var_texcoord0);
	// 加法混合：原图 + 模糊的光晕
	gl_FragColor = base + bloom * 1.5; 
}