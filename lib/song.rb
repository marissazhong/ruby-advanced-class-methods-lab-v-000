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
    self.class.all << self.save
  end

  def self.new_by_name(name)
    @name = name
  end

  def self.create_by_name(name)
    @name = name
    self.class.all << self
  end

  def self.find_by_name(name)
    self.class.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)
    create_by_name(name)
  end

  def self.alphabetical
    self.class.all.sort_by! {|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    properties = filename.split('-','.').map(&:strip)
    @name = properties[1]
    @artist = properties[0]
  end

  def self.create_from_filename(filename)
    new_song = new_from_file(filename)
    self.class.all << new_song
  end

  def self.destroy_all
    self.class.all = []
  end

end
