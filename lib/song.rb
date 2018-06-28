class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def create
    @@all << self
  end

  def new_by_name(name)
    @name = name
  end

  def create_by_name(name)
    @name = name
    @@all << self
  end

  def find_by_name(name)
    i = 0
    while i < @@all.length
      return self if self.name == name
      i+=1
    end
  end

  def find_or_create_by_name

  end

  def alphabetical

  end

  def new_from_filename

  end

  def create_from_filename

  end

  def destroy_all

  end

end
