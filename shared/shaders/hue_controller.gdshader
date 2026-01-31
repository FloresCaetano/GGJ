shader_type canvas_item;

// Aquí pasas valores como 0.20 para oscurecer
uniform float hue = 0.0;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Restamos el factor a los canales RGB
    // clamp evita que los valores sean negativos (negro absoluto)
    tex_color.rgb = clamp(tex_color.rgb - hue, 0.0, 1.0);
    
    COLOR = tex_color;
}