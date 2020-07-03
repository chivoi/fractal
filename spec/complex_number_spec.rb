require 'complex_number'

describe ComplexNumber do
  describe '#initialize' do
    it 'will assign real and imaginary numbers' do
    	c = ComplexNumber.new(2, 3)
      expect(c.re).to eq 2
      expect(c.im).to eq 3
    end
  end
end