require 'renderer'

describe Renderer do
  describe '#render' do
  	
  	let(:renderer) do
  		Renderer.new(max_iterations: 36, chars: '.,-~:;=!*#$@')
  	end

    it 'will return . for 0' do
    	result = renderer.render(0)
      expect(result).to eq '.'
    end

    it 'will return @ for 34' do
    	result = renderer.render(34)
      expect(result).to eq '@'
    end

    it 'will return ; for 16' do
    	result = renderer.render(16)
      expect(result).to eq ';'
    end

    it 'will raise an error if out of bounds' do
      expect { renderer.render(100) }.to raise_error(ArgumentError)
  	end

    #TODO: Create test when chars is not even with max_iterations
    
  end
end

#.,-~:;=!*#$@