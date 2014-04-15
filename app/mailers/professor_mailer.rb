class ProfessorMailer < ActionMailer::Base
  # TODO: Fix these email from addresses
  default from: 'from@example.com'
      # reply_to: 'foo@example.com'

  def pending_recommendation(professor)
    email_identifier = self.class.name + ':' + __method__.to_s
    email_template = Email.find_by_identifier(email_identifier)
    return unless email_template

    # @count = user.positions.count
    @name = professor.name
    @url = professor_url(professor)

    body = email_template.body.dup
    body.gsub!(/\[NAME\]/i, @name)
    body.gsub!(/\[URL\]/i, @url)
    email = professor.email + EMAIL_SUFFIX
    mail(to: email,
         body: body,
         content_type: 'text/plain',
         subject: email_template.subject,
         reply_to: email_template.reply_to)
  end
end
