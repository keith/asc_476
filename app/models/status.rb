Status = Struct.new(:name, :desc, :num) do
  def self.statuses
    [
      Status.new('Pending', 'Awaiting professor review', 0),
      Status.new('Undecided', 'Awaiting ASC review', 1),
      Status.new('Denied', 'Application rejected', 2),
      Status.new('Not Now', 'On hold for now by the ASC', 3),
      Status.new('Approved', 'Approved by the ASC', 4),
      Status.new('Hired', 'Currently working for the ASC', 5),
    ]
  end

  def self.hired?(n)
    n == Status.to_num('Hired')
  end

  def self.names
    self.statuses.map { |x| x.name }
  end

  def self.for_number(n)
    (Status.statuses.select { |x| x.num == n }).first
  end

  def self.to_num(name)
    (Status.statuses.select { |x| x.name == name }).first.num
  end

  def self.pending
    Status.to_num('Pending')
  end

  def self.undecided
    Status.to_num('Undecided')
  end

  def to_s
    "#{ name } - #{ desc }"
  end
end
