class Screen
	attr_accessor :cell_width, :cell_height, :origin_re, :origin_im, :real_width, :real_height,	:view_width, :view_height

	 # weird indentation
	def initialize(
		origin_re:,
		origin_im:, 
		real_width:, 
		real_height:, 
		view_width:, 
		view_height:)

		@origin_re = origin_re
		@origin_im = origin_im
		@real_width = real_width 
		@real_height = real_height
		@view_width = view_width
		@view_height = view_height
		
		rebuild
	end

	def convert(view_x, view_y)
		dx = view_x * cell_width
		dy = view_y * cell_height
		real_x = origin_re + dx
		real_y = origin_im - dy
		return ComplexNumber.new(real_x, real_y)
	end

	def rebuild		
		@cell_width = real_width / view_width
		@cell_height = real_height / view_height
	end
end