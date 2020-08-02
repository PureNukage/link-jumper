function draw_reset() {
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_set_font(-1)
	draw_set_alpha(1)
	
}

function wave(from, to, duration, offset) {
	var a4 = (to - from) * 0.5
	return from + a4 + sin((((current_time * 0.0001) + duration * offset) / duration) * (pi*2)) * a4	
}

function draw_text_outlined(x, y, string, text_color, outline_color) {
	/// draw_text_outline(x, y, string, text color, outline color)
	///@param x
	///@param y
	///@param string
	///@param text_color
	///@param outline_color

	var xx = x;
	var yy = y;
	var s = string;
	var c1 = text_color;
	var c2 = outline_color;

	draw_set_color(c2);
	draw_text(xx+1, yy+1, s);
	draw_text(xx-1, yy+1, s);
	draw_text(xx+1, yy-1, s);
	draw_text(xx-1, yy-1, s);

	draw_set_color(c1);
	draw_text(xx, yy, s);	
}