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
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)
    create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    song = Song.new
    properties = filename.split(/[,-]/).map(&:strip)
    song.name = properties[1]
    song.artist = properties[0]
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
