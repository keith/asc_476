class ApplicantMailer < ActionMailer::Base
  default from: "from@example.com"

  def account_email(email)
    mail to: email, subject: 'Your ASC tutoring application'
  end
end
