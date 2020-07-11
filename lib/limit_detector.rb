class LimitDetector
	attr_accessor :max_iterations, :max_absolute_value, :function
	
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
			iterations += 1
			#puts "current: #{current} iterations: #{iterations} max: #{max_absolute_value}"
			break if iterations >= max_iterations
			break if current.absolute_value_squared >= max_absolute_value
		end
		return iterations
	end
end
