class ApplicantMailer < ActionMailer::Base
  # TODO: Fix these email from addresses
  default from: 'from@example.com',
      reply_to: 'foo@example.com'

  def account_email(user)
    @count = user.positions.count
    @name = user.name
    @link = applicant_url(user)
    email = user.email + EMAIL_SUFFIX
    mail to: email, subject: 'Your ASC tutoring application'
  end
end
