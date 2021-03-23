# frozen_string_literal: true

# Index Page of an application which appears after user login

class IndexController < ApplicationController
  before_action :logged_in_user, :auth_check, only: %i[landing]
  def landing; end
end
