Standing = Struct.new(:name, :num) do |args|
  def self.standings
    [
      Standing.new('Freshman', 0),
      Standing.new('Sophomore', 1),
      Standing.new('Junior', 2),
      Standing.new('Senior', 3),
      Standing.new('Graduate', 5)
    ]
  end

  def self.names
    self.standings.map { |x| x.name }
  end

  def self.for_number(n)
    (Standing.standings.select { |x| x.num == n }).first
  end

  def to_s
    self.name
  end
end
