require 'pry'
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
     song = self.new
     song.save
     return song
 end

  def self.all
      @@all
   end

   def self.new_by_name(string)

      song = self.new
      song.name = string
      song

   end

   def self.create_by_name(string)
       song = self.new
       song.name = string
       all << song
       song
   end
   def self.find_by_name(string)

      self.all.find{|person| person.name == string }

   end

   def self.find_or_create_by_name(string)

     if self.find_by_name(string) != nil
        self.find_by_name(string)

    else
         self.create_by_name(string)
    end
  end
    def self.alphabetical

      self.all.sort_by do | value|
               value.name.capitalize
      end
    end

    def self.new_from_filename(file)

      #person = self.new
      person = self.new
      fil = file.split("-")
      person.name = fil[1].split(".")[0].strip
    #binding.pry
       person.artist_name = fil[0].strip #.split(".")[0]
       person
      #binding.pry
  #   person = self.new
  #   person.name = value.split(".")[0]
  #   #binding.pry
  #  person.artist_name = value.split
  #     # if value.end_with?(".mp3")
  #     #   #person = self.new
  #     #      values = value.split(".")
  #     #        binding.pry
  #     #      person.name = values[0]
  #     #      person
  #     # else
  #     #   person.artist_name = value[0]
  #     #   person
  #   # end
  # # end
end
   def self.create_from_filename(file)
     song = self.new_from_filename(file)
     song.save

    end

    def self.destroy_all
       @@all.clear
    end
end
