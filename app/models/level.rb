Level = Struct.new(:name, :desc, :num) do
  def self.levels
    [
      Level.new('Moderator', 'Can view and add to applications', 2),
      Level.new('Administrator', 'Can add and modify users and courses' ,0)
    ]
  end

  def self.names
    self.levels.map { |x| x.name }
  end

  def self.for_number(n)
    (Level.levels.select { |x| x.num == n }).first
  end

  def description
    "#{ name } - #{ desc }"
  end
end
