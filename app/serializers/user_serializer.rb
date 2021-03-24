class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :microposts
  has_many :users
end