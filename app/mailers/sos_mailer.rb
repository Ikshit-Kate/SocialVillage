# frozen_string_literal: true

class SosMailer < ApplicationMailer
  def send_sos(authority_email, user)
    @user = user
    mail(to: authority_email, from: @user.email, subject: "SOS from #{@user_email}")
  end
end
