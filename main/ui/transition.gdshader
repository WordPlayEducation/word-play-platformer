shader_type canvas_item;
render_mode blend_mix;

uniform float y_threshold : hint_range( 0.0, 1.0, 0.01 ) = 0.0;
uniform float tiling : hint_range(0.0, 100.0, 1.0) = 10.0;

float get_grid( vec2 uv )
{
	uv = abs( uv );
	return float( int( uv.x * 100.0 ) % int( ( 1.0 - pow( y_threshold, 2 ) ) * 100. ) ) * float( int( uv.y * 100.0 ) % int( ( 1.0 - pow( y_threshold, 2 ) ) * 100. ) );
}

float get_line( float uv )
{
	uv = mod( uv * tiling, 1.0 );
	return round( ( min( uv, 1.0 - uv ) / ( y_threshold )) );
}

void fragment()
{
	COLOR.a = COLOR.a * ( get_line( UV.x ) * get_line( UV.y * 0.6) );
}