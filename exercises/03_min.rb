def min(numbers)
  if numbers.empty?
    return nil
  else
    lowest_num = numbers.first
    numbers.each do |num|
      if num < lowest_num
        lowest_num = num
      end
    end
    return lowest_num
  end
end

# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#min' do
  it 'returns the lowest number in the array' do
    expect(min([7,5,12])).to eq(5)
    expect(min([10])).to eq(10)
  end

  it 'returns nil for empty arrays' do
    expect(min([])).to eq(nil)
  end
end
