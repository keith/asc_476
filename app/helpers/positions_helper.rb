module PositionsHelper
  def new_positions_identifier
    begin
      identifier = SecureRandom.urlsafe_base64(40)
    end while Position.find_by_identifier(identifier)
    identifier
  end
end
