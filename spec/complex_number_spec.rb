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
	  	a = ComplexNumber.new(2, -3)
	  	b = ComplexNumber.new(-3, 4)
	  	
	  	#expected result
	  	expected = ComplexNumber.new(-1, 1)
	  	result = a.add(b)
	  	# (a + ib) + (x + iy) = (a + x) + i(b +y)
	  	expect(result).to eq expected
  	end
  end

  # describe '#multiply' do
  # 	it 'will multiply two numbers' do
	 #  	# input
	 #  	first = ComplexNumber.new(2, -3) # a, b
	 #  	second = ComplexNumber.new(-3, 4) # x, y
	  	
	 #  	#expected result
	 #  	# i * i = -1
	 #  	#(a + ib)*(x + iy) = ax + iay + ibx - by
	 #  	# re = ax - by = 2 * (-3) - (-3)*4 = -6 + 12 = 6
	 #  	# i * (ay + bx) = 2*4 + (-3)*(-3) = 8 + 9 = 17  
	 #  	mul = ComplexNumber.new(6, 17)
	 #  	result = first.multiply(second)

	 #  	expect(result).to eq mul 
	 #  end 
  # end
end