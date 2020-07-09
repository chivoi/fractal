class ComplexNumber

	include Math

	attr_reader :re, :im

	def initialize(re, im)
		@re = re
		@im = im
	end

	def ==(second)
	  second.re == self.re && second.im == self.im
	end

	def to_s
		"ComplexNumber[#{re} + #{im}i]"
	end

	# TODO: static function
	def add(second)
		new_re = re + second.re
		new_im = im + second.im
		ComplexNumber.new(new_re, new_im)
	end
		
	def +(second)
		new_re = re + second.re
		new_im = im + second.im
		ComplexNumber.new(new_re, new_im)
	end

	def multiply(second)
		new_re = (re * second.re) - (im * second.im)
		new_im = (re * second.im) + (im * second.re)
		ComplexNumber.new(new_re, new_im)
	end

	def absolute_value_squared
			re**2 + im**2
	end
end

