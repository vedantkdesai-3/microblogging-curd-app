class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true , uniqueness: true
  has_many :microposts, dependent: :destroy
  has_many :follows, through: :users, source: :follow, dependent: :destroy
end
