class UserMailer < ActionMailer::Base
  # TODO: Change this email
  default from: 'from@example.com'

  def temporary_password(user)
    @user = user
    mail(to: @user.email,
         subject: 'Your ASC Tutoring temporary password',
         reply_to: 'donotreply@winthrop.edu')
  end
end
