class FollowSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user, serializer: UserSerializer
  belongs_to :user, serializer: UserSerializer
end
