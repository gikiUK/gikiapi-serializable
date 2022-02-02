require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'gikiapi/serializable'

class Model
  def initialize(params = {})
    params.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end
end

class User < Model
  attr_accessor :id, :name, :address, :posts
end

class Post < Model
  attr_accessor :id, :title, :date, :author
end

class SerializableUser < GikiAPI::Serializable::Resource
  type 'users'
  attributes :name, :address
  relationship :posts, class: 'SerializablePost'
end

class SerializablePost < GikiAPI::Serializable::Resource
  type 'posts'
  attributes :title, :date
  relationship :author, class: 'SerializableUser'
end

module API
  class SerializableUser < GikiAPI::Serializable::Resource
    type :api_users
    has_many :posts
  end

  class SerializablePost < GikiAPI::Serializable::Resource
    type :api_posts
  end
end
