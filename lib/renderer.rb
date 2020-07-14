class Renderer
	attr_reader :max_iterations, :chars, :iterations_per_char

	def initialize(max_iterations:, chars:)
		@max_iterations = max_iterations
		@chars = chars
		@iterations_per_char = max_iterations / chars.length
	end

	def render(iterations)
		index = iterations / iterations_per_char
		chars[index]
	end
end

