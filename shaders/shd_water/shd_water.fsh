//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec2 v_vScreencoord;
varying vec4 v_vColour;
uniform float TScroll;
uniform vec3 pal0;//ocean
uniform vec3 pal1;
uniform vec3 pal2;
uniform vec3 pal3;

const mat2 myt = mat2(.12121212, .13131313, -.13131313, .12121212);
const vec2 mys = vec2(1e4, 1e6);

vec2 rhash(vec2 uv) {
  uv *= myt;
  uv *= mys;
  return fract(fract(uv / mys) * uv);
}

vec3 hash(vec3 p) {
  return fract(
      sin(vec3(dot(p, vec3(1.0, 57.0, 113.0)), dot(p, vec3(57.0, 113.0, 1.0)),
               dot(p, vec3(113.0, 1.0, 57.0)))) *
      43758.5453);
}

vec3 voronoi3d(const in vec3 x) {
  vec3 p = floor(x);
  vec3 f = fract(x);

  float id = 0.0;
  vec2 res = vec2(100.0);
  for (int k = -1; k <= 1; k++) {
    for (int j = -1; j <= 1; j++) {
      for (int i = -1; i <= 1; i++) {
        vec3 b = vec3(float(i), float(j), float(k));
        vec3 r = vec3(b) - f + hash(p + b);
        float d = dot(r, r);

        float cond = max(sign(res.x - d), 0.0);
        float nCond = 1.0 - cond;

        float cond2 = nCond * max(sign(res.y - d), 0.0);
        float nCond2 = 1.0 - cond2;

        id = (dot(p + b, vec3(1.0, 57.0, 113.0)) * cond) + (id * nCond);
        res = vec2(d, res.x) * cond + res * nCond;

        res.y = cond2 * d + nCond2 * res.y;
      }
    }
  }

  return vec3(sqrt(res), abs(id));
}



void main()
{
	if(abs(v_vScreencoord.x) > 1.0 || abs(v_vScreencoord.y) > 1.0) {
		discard; //Culling because we get alot of lag otherwise!	
	}
	
	float scale = 10.0;
	vec2 coordsx = v_vTexcoord+(TScroll*3.0)+sin((v_vTexcoord.y+TScroll)/2.0);
	vec2 coordsy = -(v_vTexcoord+(TScroll*3.0)+cos((v_vTexcoord.x+TScroll)/2.0));
	
	float vorosmpx = voronoi3d( vec3(coordsx/scale,TScroll/4.0) ).x;
	float vorosmpy = voronoi3d( vec3(coordsy/scale,TScroll/4.0) ).x;
	
	float voroline = pow(vorosmpx*vorosmpy,5.0) + 0.1;
	
	vec3 retcolor = pal0/255.0;
	
	if(voroline < 0.85) {
		
		float c = floor(voroline*5.0);
		
		if(c == 0.0) {
			retcolor = pal0/255.0;
		} else if(c == 1.0) {
			retcolor = pal1/255.0;
		} else if(c == 2.0) {
			retcolor = pal2/255.0;
		} else if(c >= 3.0) {
			retcolor = pal3/255.0;
		}
		
	} else {
		retcolor = pal3;
	}
	
	//retcolor = vec3(voroline);//result);
	
	gl_FragColor.rgb = retcolor;
	
    gl_FragColor.a = 1.0; 
}
