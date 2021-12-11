#version 150

#moj_import <light.glsl>
#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord1;
out vec2 texCoord2;
out vec4 normal;
out float circle_r;
out float circle_a;
out float circle_b;
out vec2 cood;

void main() {

    float vertexId = mod(gl_VertexID, 4.0);
    vec4 color = textureLod(Sampler0, UV0,0);

    circle_r = 0.0;
    circle_a = 0.0;
    circle_b = 0.0;
    cood.x = 0.0;
    cood.y = 0.0;
    
    mat3 WorldMat = getWorldMat(Light0_Direction, Light1_Direction);
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    if(color.a < 0.505 && color.a > 0.495) {
        long transvalue = long(Color.r * 255.0) * 65536 + long(Color.g * 255.0) * 256 + long(Color.b * 255.0);
        long range_max = 1024;
        long range_bold = 32;
        long range_alpha = 100;

        circle_r = float(transvalue % range_max) / 10.0;
        transvalue /= range_max;
        circle_b = float(transvalue % range_bold) / 10.0;
        transvalue /= range_bold;
        circle_a = float(transvalue) / 100.0;
        
        if(vertexId == 0.0) {
            gl_Position = ProjMat * ModelViewMat * vec4(Position + WorldMat * vec3(circle_r - 0.5, 0.0, circle_r - 0.5), 1.0);
        }
        else if(vertexId == 1.0) {
            gl_Position = ProjMat * ModelViewMat * vec4(Position + WorldMat * vec3(circle_r - 0.5, 0.0, -circle_r + 0.5), 1.0);
            cood.x = 0.0;
            cood.y = 1.0;
        }
        else if(vertexId == 2.0) {
            gl_Position = ProjMat * ModelViewMat * vec4(Position + WorldMat * vec3(-circle_r + 0.5, 0.0, -circle_r + 0.5), 1.0);
            cood.x = 1.0;
            cood.y = 1.0;
        }
        else {
            gl_Position = ProjMat * ModelViewMat * vec4(Position + WorldMat * vec3(-circle_r + 0.5, 0.0, circle_r - 0.5), 1.0);
            cood.x = 1.0;
            cood.y = 0.0;
        }
    }

    vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    texCoord1 = UV1;
    texCoord2 = UV2;
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);
}