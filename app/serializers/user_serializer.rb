class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :microposts, serializer: UserSerializer
  has_many :users, serializer: MicropostSerializer
end
