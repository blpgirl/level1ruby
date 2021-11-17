=begin
  Instant messaging platform of short messages called Blurbs.
  A Blurb has a maximum length of just 40 characters.
=end
MYCONSTANTGLOBAL = "hello constante global"
class Blurb
  attr_accessor :content, :time, :mood

  MYCONSTANT = "hello"

  def initialize(mood, content="")
    #inside the class @variable to use attributes
    @time    = Time.now
    @content = content[0..39] #limit characters to 40, length
    @mood    = mood

    puts MYCONSTANT
  end

  def moodify
    if    @mood == :sad
      return ":-("
    elsif @mood == :happy
      puts MYCONSTANTGLOBAL
      return ":-)"
    # Add other moods here
    end

    # The default mood
    @mood
  end
end

class Blurbalizer
  def initialize(title)
    @title  = title
    @blurbs = [] # A fresh clean array
                 # for storing Blurbs
  end

  def add_a_blurb(mood, content)
    # The << means add to the end of the array
    @blurbs << Blurb.new(mood, content)
  end

  def show_timeline
    puts "Blurbify: #{@title} has #{@blurbs.count} Blurbs"

    #order by time new to latest, the reverse it for latest first
    @blurbs.sort_by { |t|
      t.time
    }.reverse.each { |t|
      puts "#{t.content.ljust(40)} #{t.time} - #{t.moodify}"
    }
  end
end

blurb1 = Blurb.new(:confused, "I can not believe Mt. Hood was stolen!")
puts blurb1.time
puts blurb1.mood
blurb1.mood = :sick
puts blurb1.mood
puts blurb1.content

myapp = Blurbalizer.new "Leyla's new Twitter"
# create a blurb like up but inside the Blurblizer class to save all messages there
myapp.add_a_blurb :moody, "Add Blurb here. My first message."
myapp.add_a_blurb :explodinghead, "This is cool and overwhelming at the same time."
myapp.add_a_blurb :happy, "Trying the smiley face."

myapp.show_timeline

#convert to strings
puts 54321.to_s
puts 54321.to_s 2 #converts to binary
puts 54321.to_s 16 #converts to hexadecimal
puts 54321.to_s(8) #converts to octal

puts $= #no idea what case-insensitivity flag means and why is it useful???
puts $0 #The name of the ruby script file currently executing

gets()
puts $_ #will print what I write in the keyboard
