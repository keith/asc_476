class ApplicantMailer < ActionMailer::Base
  # TODO: Fix these email from addresses
  default from: 'from@example.com'
  #     reply_to: 'foo@example.com'

  def account_email(user)
    email_identifier = self.class.name + ':' + __method__.to_s
    template, body = template_helper(email_identifier, user)
    return unless template && body
    email = user.email + EMAIL_SUFFIX
    mail(to: email,
         body: body,
         content_type: 'text/plain',
         subject: template.subject,
         reply_to: template.reply_to)
  end

  def acceptance_email(user)
    email_identifier = self.class.name + ':' + __method__.to_s
    template, body = template_helper(email_identifier, user)
    return unless template && body
    email = user.email + EMAIL_SUFFIX
    mail(to: email,
         body: body,
         content_type: 'text/plain',
         subject: template.subject,
         reply_to: template.reply_to)
  end

  private

    def template_helper(identifier, user)
      template = Email.find_by_identifier(identifier)
      return nil unless template

      @name = user.name
      @url = applicant_url(user)
      body = template.body.dup
      body.gsub!(/\[NAME\]/i, @name)
      body.gsub!(/\[URL\]/i, @url)
      return template, body
    end
end
