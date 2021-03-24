module Audit
  module Auditor
    extend ActiveSupport::Concern
    include Security::Authentication
    def audit_application
      if session_user
        HistoryWorker.perform_async(session_user.name, Time.now, controller_name, @_action_name)
      else
        HistoryWorker.perform_async('Non User Page', Time.now, controller_name, @_action_name)
      end
    end
  end
end
