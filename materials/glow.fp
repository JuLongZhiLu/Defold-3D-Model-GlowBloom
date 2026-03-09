varying mediump vec2 var_texcoord0;
uniform lowp sampler2D tex0;
uniform lowp vec4 tint; // tint.rgb 设为 1,1,1 即可，tint.a 控制总强度

void main()
{
	lowp vec4 tex = texture2D(tex0, var_texcoord0);

	// 1. 计算亮度 (Luminance)
	// 使用标准算法将 RGB 转为亮度，这样 Shader 就知道哪里是明亮的纹理细节
	lowp float brightness = dot(tex.rgb, vec3(0.2126, 0.7152, 0.0722));

	// 2. 自动提取发光区域 (Threshold Mask)
	// 对亮度进行幂运算。这样暗部几乎为 0，只有亮部会被选中
	lowp float mask = pow(brightness, 4.0); 

	// 3. 通用发光计算
	// 我们直接用纹理本身的颜色 (tex.rgb) 乘以刚才算出的掩码
	// 这样：绿色纹理发绿光，棕色纹理发棕光，且颜色完全匹配
	// tint.rgb 建议设为 1,1,1，如果想整体调色再改它
	// 6.0 是发光强度，觉得太亮就调小。
	// 也可以在glow.material中通过tint的w来调整发光强度
	lowp vec3 glow = tex.rgb * tint.rgb * mask * tint.a * 6.0;

	// 4. 最终混合
	// 这种写法保证了暗部纹理 100% 原始保留，亮部纹理自然溢出
	gl_FragColor = vec4(tex.rgb + glow, tex.a);
}