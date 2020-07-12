#!/usr/bin/env ruby
require './lib/complex_number'
require './lib/limit_detector'
require './lib/screen'
require './lib/renderer'

require 'io/console'

COLS = 30
ROWS = 120
MAX_ITERATIONS = 11
# value from here https://mathworld.wolfram.com/MandelbrotSet.html
CONSTANT = ComplexNumber.new(-0.75, 0.1)
SYMBOL_MAP = "@MBHENR\#KWXDFPQASUZbdehx*8Gm&04LOVYkpq5Tagns69owz$CIu23Jcfry%1v7l+it[] {}?j|()=~!-/<>\"^_';,:`. ".reverse

constant = CONSTANT
renderer = Renderer.new(
	max_iterations: MAX_ITERATIONS, 
	chars: SYMBOL_MAP
)

limit_detector = LimitDetector.new(
	max_iterations: MAX_ITERATIONS,
	max_absolute_value: 4,
	function: lambda { |z| z.multiply(z) + constant }
)

screen = Screen.new(
	origin_re: -1.5,
	origin_im: 1.5,
	real_width: 1.0,
	real_height: 2.0,
	view_width: COLS,
	view_height: ROWS
)

while true
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

	puts "Enter command: `x` to quit "
	key = STDIN.getch

	case key
	when 'x'
		break
	when 'w'
		screen.origin_re -= screen.real_width/10
	when 's'
		screen.origin_re += screen.real_width/10
	when 'q'
		screen.origin_im += screen.real_height/10
	when 'a'
		screen.origin_im -= screen.real_height/10
	when 'e' # zoom out
		dx = screen.origin_re.abs()/10
		dy = screen.origin_im.abs()/10
		screen.origin_re -= dx
		screen.origin_im += dy
		screen.real_width = screen.real_width + 2*dx
		screen.real_height = screen.real_height + 2*dy
		screen.rebuild()
	when 'd' # zoom out
		dx = screen.origin_re.abs()/10
		dy = screen.origin_im.abs()/10
		screen.origin_re += dx
		screen.origin_im -= dy
		screen.real_width = screen.real_width - 2*dx
		screen.real_height = screen.real_height - 2*dy
		screen.rebuild()
	when 'r'
		constant.re += constant.re.abs()/10
		limit_detector.function = lambda { |z| z.multiply(z) + constant }
	when 'f'
		constant.re -= constant.re.abs()/10
		limit_detector.function = lambda { |z| z.multiply(z) + constant }
	when 't'
		constant.im += constant.im.abs()/10
		limit_detector.function = lambda { |z| z.multiply(z) + constant }
	when 'g'
		constant.im -= constant.im.abs()/10
		limit_detector.function = lambda { |z| z.multiply(z) + constant }
	else
		puts "No such command"
	end
end





