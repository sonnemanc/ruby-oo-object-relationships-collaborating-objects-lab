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

    def self.new_by_filename(filename)
        file = filename.split(" - ")
        song = file[1]
        artist = file[0]

        new_instance = self.new(song)
        new_instance.artist_name = artist
        new_instance 
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end
 