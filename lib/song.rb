require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(name)
        x = self.new(name.chomp('.mp3').split(" - ")[1])
        x.artist_name=(name.chomp('.mp3').split(" - ")[0])
        return x
    end

    def artist_name=(artist1)
        self.artist = Artist.find_or_create_by_name(artist1)
        artist.add_song(self)
    end

end