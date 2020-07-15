class Renderer
	attr_reader :max_iterations, :chars, :iterations_per_char

	def initialize(max_iterations:, chars:)
		@max_iterations = max_iterations
		@chars = chars
		@iterations_per_char = max_iterations.to_f / chars.length
	end

	def render(iterations)
		raise ArgumentError, "#{iterations} > #{max_iterations}!" if iterations >= max_iterations 
		index = (iterations / iterations_per_char).round
		chars[index]
	end
end

