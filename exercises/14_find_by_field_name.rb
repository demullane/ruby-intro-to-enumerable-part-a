def find_by_field_name(array,key,value)
  if array == []
    return nil
  else
    counter = false
    array.each do |hash|
      hash.each do |k,v|
        if k == key && v == value
          counter = true
        end
      end
      if counter == true
        return hash
      end
    end
    return nil
  end
end
# ------ code above this line ------

require 'rspec/autorun'

RSpec.describe '#find_by_field_name' do
  it 'returns the hash where the value for the given key matches the given value' do
    input = [
      {id: 3, name: 'English'},
      {id: 5, name: 'Spanish'},
      {id: 7, name: 'French'},
    ]

    expect(find_by_field_name(input, :name, 'Spanish')).to eq({id: 5, name: 'Spanish'})
    expect(find_by_field_name(input, :id, 3)).to eq({id: 3, name: 'English'})
  end

  it 'returns nil when given an empty array' do
    expect(find_by_field_name([], :foo, 10)).to eq(nil)
  end

  it 'returns nil when given a key/value that does not exist in the array' do
    input = [ {id: 3, name: 'English'} ]

    expect(find_by_field_name(input, :id, 8)).to eq(nil)
    expect(find_by_field_name(input, 'id', 8)).to eq(nil)
    expect(find_by_field_name(input, :name, 'foo')).to eq(nil)
  end
end
