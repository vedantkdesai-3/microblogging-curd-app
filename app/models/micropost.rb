# frozen_string_literal: true

class Micropost < ApplicationRecord
  validates :content, length: { minimum: 0, maximum: 40 }
  belongs_to :user
end
