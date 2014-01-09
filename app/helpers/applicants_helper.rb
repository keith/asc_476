module ApplicantsHelper
  def new_applicant_identifier
    begin
      identifier = SecureRandom.urlsafe_base64(36)
    end while Applicant.find_by_identifier(identifier)
    identifier
  end
end
