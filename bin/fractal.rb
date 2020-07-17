#!/usr/bin/env ruby

require "tty-box"
require "tty-screen"

require "./lib/complex_number"
require "./lib/limit_detector"
require "./lib/renderer"
require "./lib/screen"

puts "Fractal generator version 0.0.1"
puts "==============================="
puts "Created by chivoii and kirghoff"

chars = "@MBHENR\#KWXDFPQASUZbdehx*8Gm&04LOVYkpq5Tagns69owz$CIu23Jcfry%1v7l+it[]{}?j|()=~!-/<>\"^_';,:`. ".reverse
#chars = '.,-~:;=!*\#$@ '
#puts "Chars length is #{chars.length}"
width = TTY::Screen.cols - 5
height = TTY::Screen.rows

renderer = Renderer.new(
	max_iterations: chars.length, 
	chars: chars
)

constant = ComplexNumber.new(-0.01, 0.45)
function = lambda { |z| z.multiply(z) + constant}

limit_detector = LimitDetector.new(
  max_iterations: chars.length - 1, 
  max_absolute_value: 4, 
  function: function
)

screen = Screen.new(
	origin: ComplexNumber.new(-1.5, 1.5), 
	real_width: 3.0, 
	real_height: 3.0,
	view_width: width,
	view_height: height
)

output = []

for y in 0..height
	for x in 0..width
		number = screen.convert(x, y)
		iterations = limit_detector.iterations(number)
		character = renderer.render(iterations)
		output << character 
		# puts "#{x}, #{y}, #{number}, #{iterations}, #{character}"
	end
	output << "\n" 
end

#TODO make the box the size of the terminal + controls

box = TTY::Box.frame(width: TTY::Screen.cols, height: TTY::Screen.rows, border: :thick) do
	"#{output.join}"
end
	
print box

