require 'spec_helper'

describe GikiAPI::Serializable::Resource, '.meta' do
  it 'accepts a hash' do
    klass = Class.new(GikiAPI::Serializable::Resource) do
      type 'foo'
      meta foo: 'bar'
    end
    resource = klass.new(object: User.new)
    actual = resource.as_jsonapi[:meta]
    expected = {
      foo: 'bar'
    }

    expect(actual).to eq(expected)
  end

  it 'accepts a block' do
    klass = Class.new(GikiAPI::Serializable::Resource) do
      type 'foo'
      meta do
        { foo: 'bar' }
      end
    end
    resource = klass.new(object: User.new)
    actual = resource.as_jsonapi[:meta]
    expected = {
      foo: 'bar'
    }

    expect(actual).to eq(expected)
  end
end
