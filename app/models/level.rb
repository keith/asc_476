Level = Struct.new(:name, :desc, :num) do
  def self.levels
    [
      Level.new('Moderator', 'Can view and add to applications', 2),
      Level.new('Administrator', 'Can add and modify users and courses' ,0)
    ]
  end

  def description
    "#{ name } - #{ desc }"
  end
end

