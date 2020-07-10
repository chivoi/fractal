#!/usr/bin/env ruby
require './lib/complex_number'
require './lib/limit_detector'
require './lib/screen'
require './lib/renderer'

puts "Fractal ASCII generator v1.0"
puts "============================"

COLS = 40
ROWS = 20
MAX_ITERATIONS = 12

screen = Screen.new(
	origin_re: -1.5,
	origin_im: 1.5,
	real_width: 3.0,
	real_height: 3.0,
	view_width: COLS,
	view_height: ROWS
)

renderer = Renderer.new(
	max_interations: MAX_ITERATIONS, 
	chars: ".,-~:;=!*#$@"
)

limit_detector = LimitDetector.new(
	max_interations: MAX_ITERATIONS,
	max_absolute_value: 4
)

# for x in 0..COLS
# 	for y in 0..ROWS
xs = 0..COLS
ys = 0..ROWS
points = xs.zip(ys).flatten

chars = points.map do |(x, y)|
	puts "x=#{x}, y=#{y}"
end





