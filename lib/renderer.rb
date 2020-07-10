class Renderer
	attr_reader :max_iterations, :chars, :iterations_per_char

	def initialize(max_iterations:, chars:)
		@max_iterations = max_iterations
		@chars = chars
		@iterations_per_char = max_iterations / chars_count
	end

	def render(iteration)
		index = (iteration / iterations_per_char).round
		chars[index]
	end

	def chars_count
		chars.length
	end
end