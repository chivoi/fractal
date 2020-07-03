class ComplexNumber
	attr_reader :re, :im

	def initialize(re, im)
		@re = re
		@im = im
	end

	def ==(another)
	  another.re == self.re && another.im == self.im
	end

	# TODO: static function
	def add(second)
		new_re = re + second.re
		new_im = im + second.im
		ComplexNumber.new(new_re, new_im)
	end

	def multiply(second)
	end
end
