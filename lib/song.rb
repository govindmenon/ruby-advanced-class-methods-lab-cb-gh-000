class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    s = @@all.find{|song| song.name == name}
    s = Song.create_by_name(name) if s == nil
    s
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    x = filename.split(/[-.]/)
    song = Song.create_by_name(x[1].strip)
    song.artist_name = x[0].strip
    song
  end

  def self.create_from_filename(filename)
    x = filename.split(/[-.]/)
    song = Song.create_by_name(x[1].strip)
    song.artist_name = x[0].strip
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
