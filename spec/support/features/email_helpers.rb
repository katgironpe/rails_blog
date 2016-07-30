# See email-spec https://github.com/bmabey/email-spec
module Features
  module EmailHelpers
    def unread_emails(user)
      unread_emails_for(user.email)
    end
  end
end
