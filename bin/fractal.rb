#!/usr/bin/env ruby

require "./lib/complex_number"
require "./lib/limit_detector"
require "./lib/renderer"
require "./lib/screen"

puts "Fractal generator version 0.0.1"
puts "==============================="
puts "Created by chivoii and kirghoff"

chars = '.,-~:;=!*\#$@ '
width = 80
height = 20

renderer = Renderer.new(
	max_iterations: chars.length, 
	chars: chars
)

constant = ComplexNumber.new(-0.75, 0.1)
function = lambda { |z| z.add(constant) }

limit_detector = LimitDetector.new(
  max_iterations: chars.length, 
  max_absolute_value: 4, 
  function: function
)

screen = Screen.new(
	origin: ComplexNumber.new(-1.5, 1.5), 
	real_width: 6.0, 
	real_height: 4
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
		#puts "#{number}, #{iterations}, #{character}"
	end
	output << "\n" 
end

print "#{output.join}"

