class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :microposts, serializer: MicropostSerializer
  has_many :users, serializer: UserSerializer
end
