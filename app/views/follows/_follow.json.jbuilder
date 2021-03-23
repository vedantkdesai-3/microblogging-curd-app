# frozen_string_literal: true

json.extract! follow, :id, :user_id, :following_user_id, :created_at, :updated_at
json.url follow_url(follow, format: :json)
