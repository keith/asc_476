module PositionsHelper
  def new_positions_identifier
    begin
      identifier = SecureRandom.urlsafe_base64(40)
    end while Position.find_by_identifier(identifier)
    identifier
  end

  def professor_name_string(position)
    if logged_in?
      position.professor.name
    else
      'Professor'
    end
  end

  def bool_string(bool)
    if bool.nil?
      'Pending'
    elsif bool
      'Yes'
    else
      'No'
    end
  end
end
