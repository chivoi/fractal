class LimitDetector
	attr_reader :max_iterations, :max_absolute_value, :function
	
	def initialize(max_iterations:, max_absolute_value:, function:)
		@max_iterations = max_iterations
		@max_absolute_value = max_absolute_value
		@function = function
	end

	def iterations(number)
		current = number
		iterations = 0
		loop do
			current = function.call(current)
			# puts "LD #{number}, #{current}, #{iterations}"
			iterations += 1
			break if iterations >= max_iterations
			break if current.absolute_value_squared >= max_absolute_value
		end
		return iterations
	end
end
