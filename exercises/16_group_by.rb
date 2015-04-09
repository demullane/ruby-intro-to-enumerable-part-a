def group_by(array, key)
  if array == []
    return {}
  else
    result = {}
    key_record = []
    if key == :x
      index = 0
    elsif key == :y
      index = 1
    else
      return result
    end
    array.each do |hash|
      if hash.keys[index] == key
        if !(key_record.include?(hash.values[index]))
          key_record << hash.values[index]
          result[hash.values[index]] = [hash]
        else
          result[hash.values[index]] << hash
        end
      else
        return {nil => array}
      end
    end
    return result
  end
end
# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#group_by' do
  it 'returns a hash where the values are arrays of items, grouped by the given key' do
    input = [
      {x: 1, y: 6},
      {x: 5, y: 2},
      {x: 5, y: 6},
    ]

    expect(group_by(input, :x)).to eq({
      1 => [ {x: 1, y: 6} ],
      5 => [
        {x: 5, y: 2},
        {x: 5, y: 6},
      ],
    })

    expect(group_by(input, :y)).to eq({
      2 => [
        {x: 5, y: 2},
      ],
      6 => [
        {x: 1, y: 6},
        {x: 5, y: 6},
      ],
    })
  end

  it 'returns an empty hash when given an empty array' do
    expect(group_by([], :foo)).to eq({})
  end

  it 'returns nil as a key when given a hash that does not contain the given key' do
    input = [ {y: 5} ]

    expect(group_by(input, :x)).to eq({ nil => [ {y: 5} ] })
  end
end
