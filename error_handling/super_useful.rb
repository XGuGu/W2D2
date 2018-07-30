# PHASE 2
class CoffeeError < StandardError; end
class NameError < StandardError; end
class PastTimeError < StandardError; end
class KnownError < StandardError; end

def convert_to_int(str)
  begin
    int = Integer(str)
  rescue ArgumentError => e
    puts "Something went wrong with :#{e.message}"
  ensure
    int ||= nil
  end

  int
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
      puts " I love coffee! Try again!"
  else
    raise StandardError
      puts "I don't like this"
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    retry
  rescue StandardError
    puts "I dont like this!"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise NameError if name.length <= 0
    raise PastTimeError if fav_pastime.length <= 0
    raise KnownError if yrs_known < 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
