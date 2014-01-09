module ProfessorsHelper
  def new_professor_identifier
    begin
      identifier = SecureRandom.urlsafe_base64(32)
    end while Professor.find_by_identifier(identifier)
    identifier
  end
end
