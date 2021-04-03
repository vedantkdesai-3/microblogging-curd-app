# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_presence_of :password_digest

  validates :email, presence: true, uniqueness: true
  has_many :microposts, dependent: :destroy
  has_and_belongs_to_many :users, join_table: 'follows', foreign_key: 'following_user_id', dependent: :destroy
end
