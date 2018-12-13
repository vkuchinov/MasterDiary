#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform vec2 resolution;
uniform float time;

uniform float freq;
uniform float d;

uniform sampler2D texture;

#define N 64  
#define SIZE 0.5 
#define M_PI 6.28318530718

float gauss(float x_) { return exp(-(x_ * x_)/(SIZE * SIZE)); }

float rndi(int i_, int j_){

	vec2 uv = vec2( 0.5 + float(i_), 0.5 + float(j_)) / resolution.y;
	return texture2D(texture, uv).r;
    
}

float gabor(vec2 pos_, vec2 dir_) {

    float g = gauss(pos_.x) * gauss(pos_.y);
    float s = 0.5 * sin(dot(pos_, dir_) * 2.0 * M_PI - 10. * time);
	return g * s;
    
}

void main(void) {

    vec2 uv = gl_FragCoord.xy / resolution.y;
    
	vec3 col= vec3(0.);
	
	for (int i=0; i < N; i++) {
    
		vec2 pos = vec2(1.5 * rndi(i, 0), rndi(i, 1));
		vec2 dir = (1.0 + d) * vec2(rndi(i, 2), rndi(i, 3)) - d;
		col += gabor(uv - pos, freq * dir) * texture2D(texture, pos).rgb;
        
	}

    gl_FragColor = vec4(col, 1.0);

}
