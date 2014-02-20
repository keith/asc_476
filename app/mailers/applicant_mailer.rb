class ApplicantMailer < ActionMailer::Base
  default from: "from@example.com"

  def account_email(user)
    @name = user.name
    # TODO: Make sure this actually resolves the correct URL in production
    @link = applicant_url(user)
    mail to: user.email, subject: 'Your ASC tutoring application'
  end
end
