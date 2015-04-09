def reduce(words)
  words.join("")
end
# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#reduce' do
  it 'returns an string of the concatonation plus space of words in the array' do
    input = ['Super', 'cali', 'fragi', 'listic', 'expial', 'i', 'do', 'cious']

    expect(reduce(input)).to eq('Supercalifragilisticexpialidocious')
  end
end
