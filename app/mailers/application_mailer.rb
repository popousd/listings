class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@listings.com'
  layout 'mailer'
end
