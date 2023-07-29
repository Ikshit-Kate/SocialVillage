# frozen_string_literal: true

class BroadcastmailMailer < ApplicationMailer
  def broadcast(broadcast)
    @broadcast = broadcast
    mail(to: User.pluck(:email), from: User.find_by(role: 'secretary').email, subject: "New broadcast")
  end
end
