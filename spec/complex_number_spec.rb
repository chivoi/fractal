require 'complex_number'

describe ComplexNumber do
  
  describe '#initialize' do
    it 'will assign real and imaginary numbers' do
    	c = ComplexNumber.new(2, 3)
      expect(c.re).to eq 2
      expect(c.im).to eq 3
    end
  end

  # z -> z^2 + c

  describe '#add' do
  	it 'will add one number to another' do
	  	# input
	  	first = ComplexNumber.new(2, -3)
	  	second = ComplexNumber.new(-3, 4)
	  	
	  	#expected result
	  	expected = ComplexNumber.new(-1, 1)
	  	result = first.add(second)
	  	# (a + ib) + (x + iy) = (a + x) + i(b +y)
	  	expect(result).to eq expected
  	end
  end

  describe '#multiply' do
  	it 'will multiply two numbers' do
	  	# input
	  	first = ComplexNumber.new(2, -3) # a, b
	  	second = ComplexNumber.new(-3, 4) # x, y
	  	
	  	#expected result
	  	# i * i = -1
	  	#(a + ib)*(x + iy) = ax + iay + ibx - by
	  	# re = ax - by = 2 * (-3) - (-3)*4 = -6 + 12 = 6
	  	# i * (ay + bx) = 2*4 + (-3)*(-3) = 8 + 9 = 17  
	  	mul = ComplexNumber.new(6, 17)
	  	result = first.multiply(second)

	  	expect(result).to eq mul 
	  end 

	  describe '#absolute_value_squared' do
  	it 'will calculate the absolute value squared' do
	  	# input
	  	num = ComplexNumber.new(2, -3) # a, b
	  	
	  	#expected result
	  	#mod**2 = a**2 + b**2

	  	module_squared = 13
	  	result = num.absolute_value_squared

	  	expect(result).to eq module_squared 
	  	end
		end 
  end
end
