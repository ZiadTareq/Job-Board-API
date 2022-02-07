# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'ziadtareq@outlook.com'
  def seen_application(user)
    mail(to: user, subject: 'your application has been reviewed')
  end
end
