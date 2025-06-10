// Эффект помех и бегущей линии (CRT-эффект)
precision mediump float;
uniform sampler2D tex;
uniform float time;
uniform vec2 resolution;

void main() {
    vec2 uv = gl_FragCoord.xy / resolution;
    vec4 color = texture2D(tex, uv);

    // Добавляем случайные помехи
    float noise = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453 + time));
    color.rgb += noise * 0.1;

    // Бегущая горизонтальная линия
    float scanline = sin(uv.y * 800.0 + time * 5.0) * 0.05;
    color.rgb += scanline;

    // Затемнение по краям (виньетирование)
    float vignette = 1.0 - distance(uv, vec2(0.5)) * 0.5;
    color.rgb *= vignette;

    gl_FragColor = color;
}
