require 'spec_helper'

describe GikiAPI::Serializable::Resource, '.attributes' do
  it 'defines multiple attributes' do
    klass = Class.new(GikiAPI::Serializable::Resource) do
      type 'foo'
      attributes :name, :address
    end
    user = User.new(name: 'foo', address: 'bar')
    resource = klass.new(object: user)
    actual = resource.as_jsonapi[:attributes]
    expected = {
      name: 'foo',
      address: 'bar'
    }

    expect(actual).to eq(expected)
  end
end
