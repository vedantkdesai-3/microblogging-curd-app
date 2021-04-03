# frozen_string_literal: true

class Micropost < ApplicationRecord
  validates_presence_of :content
  validates_presence_of :user_id
  validates :content, length: { minimum: 0, maximum: 40 }
  belongs_to :user
end
