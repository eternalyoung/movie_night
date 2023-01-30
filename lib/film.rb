class Film
  attr_reader :title, :filmmaker, :year

  def initialize(args)
    @title = args[:title]
    @filmmaker = args[:filmmaker]
    @year = args[:year]
  end

  def to_s
    "#{@filmmaker} — #{@title} (#{@year})"
  end
end
