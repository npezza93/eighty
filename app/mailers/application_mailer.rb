# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@eightynotes.com"
  layout "mailer"
end
