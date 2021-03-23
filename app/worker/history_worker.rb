# frozen_string_literal: true

class HistoryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_name, logged_in_time, controller, action)
    puts '@@@@@Sidekiq Worker Running@@@@@'
    puts format('User: %<un>s : time : %<ts>s : controller: %<ctr>s : action : %<act>s',
                un: user_name, ts: logged_in_time, ctr: controller, act: action)
  end
end
