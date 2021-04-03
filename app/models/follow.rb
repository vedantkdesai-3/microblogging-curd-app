# frozen_string_literal: true

class Follow < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :following_user_id
  belongs_to :user
  belongs_to :user
end
