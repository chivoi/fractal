#!/usr/bin/env ruby
require './lib/complex_number'
require './lib/limit_detector'
require './lib/screen'
require './lib/renderer'

COLS = 20
ROWS = 40
MAX_ITERATIONS = 11
# value from here https://mathworld.wolfram.com/MandelbrotSet.html
CONSTANT = ComplexNumber.new(-0.75, 0.1)
SYMBOL_MAP = ".,-~:;=!*\#$@"

screen = Screen.new(
	origin_re: -1.5,
	origin_im: 1.5,
	real_width: 3.0,
	real_height: 3.0,
	view_width: COLS,
	view_height: ROWS
)

renderer = Renderer.new(
	max_iterations: MAX_ITERATIONS, 
	chars: SYMBOL_MAP
)

limit_detector = LimitDetector.new(
	max_iterations: MAX_ITERATIONS,
	max_absolute_value: 4,
	function: lambda { |z| z.multiply(z) + CONSTANT }
)

# xs = [0..COLS]
# ys = [0..ROWS]
# points = xs.product(ys)
# chars = points.each.map do |x, y|
# 	puts "x=#{x}, y=#{y}"
# end
# puts "Points: #{points}"

output = []
for x in 0..COLS
	for y in 0..ROWS
		z = screen.convert(x, y)
		iterations = limit_detector.iterations(z)
		puts "GOTCHA: #{iterations}" if iterations >= SYMBOL_MAP.length
		cell = renderer.render(iterations)
		output.append(cell)
	end
	output.append("\n")
end

puts "Fractal ASCII generator v1.0"
puts "============================"

puts "origin=[#{screen.origin_re}, #{screen.origin_im}]" +
	" max_iterations: #{MAX_ITERATIONS}"

puts "real=[#{screen.real_width}, #{screen.real_height}]" +
	" view=[#{screen.view_width}, #{screen.view_height}]"

puts "formula: z=z^2 + #{CONSTANT}"
puts "#{output.join}"






