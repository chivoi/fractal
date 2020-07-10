require 'fractal'

#                   real_width, view_width
#  (origin (re, im))------
#                   |    | real_height, view_height
#                   |    |
#                   ------
# (view_x, view_y) => (real_x, real_y)

# 1) to output text 40x40 (view)
# 2) for every character/pixel 
# 3)   (col, row) (convert)=> z 
#		   z (limit) => interations 
#      iteration (render)  => char ".,-~:;=!*#$@"

# origin = (-0.5, 0.5), real_width = 1.0, real_height = 1.0
# view_width = 10, view_height = 10

describe Screen do
	let(:screen) do
		Screen.new(
			origin: ComplexNumber.new(-0.5, 0.5), 
			real_width: 1.0, 
			real_height: 1.0,
			view_width: 10,
			view_height: 10
		)
	end

  describe '#convert' do
    it 'will correctly return 0,0' do
    	result = screen.convert(0, 0)
      expect(result).to eq ComplexNumber.new(0.0, 0.0)
    end
  end
end





