class Renderer
	attr_reader :max_iterations, :chars, :iterations_per_char

	def initialize(max_iterations:, chars:)
		@max_iterations = max_iterations
		@chars = chars
		@iterations_per_char = max_iterations / chars_count
	end

	def render(iteration)
		if not iteration.between?(0, max_iterations) 
			message = "iteration #{iteration} should be between 0 and #{max_iterations}"
			raise ArgumentError.new(message) 
		end

		index = (iteration / iterations_per_char).round
		result = chars[index]
		puts "index:#{index} result:#{result}"
		result
	end

	def chars_count
		chars.length
	end
end