require 'limit_detector'

describe LimitDetector do
  
  describe '#iterations' do
    it 'will tell how many iterations needed to go to infinity' do
    	#-----------------------------------
    	# set up
    	constant = ComplexNumber.new(2, 0)
    	function = lambda { |z| z.add(constant) } # z**2 + c

    	limit_detector = LimitDetector.new(
    		max_iterations: 10, 
    		max_absolute_value: 100.0, 
    		function: function
    	)

    	# calculation
    	number = ComplexNumber.new(0, 0)
    	result = limit_detector.iterations(number)
    	#-----------------------------------
    	expect(result).to eq 5
    end
  end
end
