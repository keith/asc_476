Status = Struct.new(:name, :desc, :num) do
  # TODO: Better description wordings here
  # TODO: possible add status for pending professor and pending ASC, auto update
  def self.statuses
    [
      Status.new('Pending', 'Waiting for further action', 0),
      Status.new('Denied', 'Rejected by ASC', 1),
      Status.new('Not Now', 'On hold for now by the ASC', 2),
      Status.new('Approved', 'Confirmed by the ASC', 3),
    ]
  end

  def self.names
    self.statuses.map { |x| x.name }
  end

  def self.for_number(n)
    (Status.statuses.select { |x| x.num == n }).first
  end

  def to_s
    "#{ name } - #{ desc }"
  end
end
