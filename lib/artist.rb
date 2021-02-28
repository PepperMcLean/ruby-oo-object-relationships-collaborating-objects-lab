require 'pry'
class Artist
    attr_accessor :name
    @@all = []
    # @@artistnames = []
    def initialize(name)
        @name = name
        @@all << self
        # @songs = []
        # if not @@artistnames.include? self.name
        #     @@artistnames << self.name
        #     @@artists << self
        # else
        #     @@artistnames.each_with_index do |artist, index|
        #         if artist == self.name
        #             @@artists[index] = self
        #         end
        #     end 
        # end
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find(name) 
        self.all.find {|artist| artist.name == name} 
    end

    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else
            x = Artist.new(name)
            return x
        end
    end

    def print_songs
        songs.each do |string|
            puts string.name
        end
    end
end