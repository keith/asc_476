class ProfessorMailer < ActionMailer::Base
  # TODO: Fix these email from addresses
  default from: 'from@example.com',
      reply_to: 'foo@example.com'

  def pending_recommendation(professor)
    @count = professor.positions.count
    @name = professor.name
    @link = professor_url(professor)
    email = professor.email + EMAIL_SUFFIX
    mail to: email, subject: 'Pending ASC tutoring recommendation'
  end
end
