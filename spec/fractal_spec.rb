require 'fractal'

describe Fractal::generate do
  it 'will return fractal' do
  	expect(Fractal.generate).to eq "Kirill"
  end
end