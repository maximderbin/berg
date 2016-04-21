require "admin/email"

module Admin
  module Users
    module Emails
      class AccountActivation < Admin::Email
        configure do |config|
          config.template = "account_activation"
        end

        def locals(*)
          { user: user, user_activation_url: user_activation_url }
        end

        def to
          user.email
        end

        def subject
          t["admin.mails.users.account_activation.subject"]
        end

        def user_activation_url
          "#{Container.options.admin_url}/users/update-password/#{user.access_token}"
        end

        def user
          options.fetch(:user)
        end
      end
    end
  end
end