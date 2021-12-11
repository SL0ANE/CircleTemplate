#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec4 normal;
in vec2 cood;
in float circle_r;
in float circle_a;
in float circle_b;

out vec4 fragColor;


void main() {
    float cox = cood.x;
    vec4 color = textureLod(Sampler0, texCoord0,0);

    if (color.a < 0.1) {
        discard;
    }
    else if(color.a < 0.505 && color.a > 0.495) {
        float max = pow(0.5, 2.0);
        float min = pow(0.5 - circle_b / circle_r / 2, 2.0);
        float current_r = pow(cood.x - 0.5, 2) + pow(cood.y - 0.5, 2);

        if(current_r <= max && current_r > min) color = vec4(color.rgb, circle_a);
        else discard;
    }
    else color *= vertexColor * ColorModulator;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
