#!/usr/bin/env ruby

require "tty-box"
require "tty-screen"
require "io/console"

require "./lib/complex_number"
require "./lib/limit_detector"
require "./lib/renderer"
require "./lib/screen"

#chars = "─━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋"
chars = "@MBHENR\#KWXDFPQASUZbdehx*8Gm&04LOVYkpq5Tagns69owz$CIu23Jcfry%1v7l+it[]{}?j|()=~!-/<>\"^_';,:`. ".reverse
#chars = '.,-~:;=!*\#$@ '
#puts "Chars length is #{chars.length}"
width = TTY::Screen.cols - 5
height = TTY::Screen.rows - 9

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

loop do

	system "clear"
	puts "Fractal generator version 0.0.1"
	puts "==============================="
	puts "Created by chivoii and kirghoff"

	puts "Press w,a,s,d to change shape, x to exit"
	puts "Constant = #{constant.re} + #{constant.im}i"

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

	print TTY::Box.frame "#{output.join}"

	#print box

	key = STDIN.getch

	case key
		when "s"
			screen.origin.im += screen.real_height / 10
		when "w"
			screen.origin.im -= screen.real_height / 10
		when "d"
			screen.origin.re -= screen.real_width / 10
		when "a"
			screen.origin.re += screen.real_width / 10
		when "i"
			constant.im += constant.absolute_value / 10
		when "k"
			constant.im -= constant.absolute_value / 20
		when "j"
			constant.re += constant.absolute_value / 10
		when "l"
			constant.re -= constant.absolute_value / 20
		when "x"
			break
		else 
			puts "Change fractal shape with wsad keys"
	end

puts "Baiiiiieeee."

end

