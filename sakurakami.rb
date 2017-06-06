$phone_ringing = false
$window_count = 0
$phone_count = 0
$couch = false

def start
  puts "You didn't close the blind last night."
  puts "The morning sunlight wakes you."
  puts "Although it is early, you are immediately alert.  It is as if something needs to happen."
  puts "But you know you have nothing to do today."
  puts "You remember last night and Aiko."
  bedroom
end

def bedroom
  puts "Your bedroom has a WINDOW, and a door leading to the LIVING ROOM, KITCHEN and BATHROOM"
  print "> "

  start_action = $stdin.gets.chomp.downcase

  if start_action == "window"
    window
  elsif start_action == "living room"
    living_room
  elsif start_action == "kitchen"
    kitchen
  elsif start_action == "bathroom"
    bathroom
  else
    puts "You lay for a while longer."
    puts "It's time to get up..."
    bedroom
  end
end

def bathroom
puts "You are in the bathroom."
end

def kitchen
  puts "You are in the kitchen."
end

def living_room
    puts "The living room of your small Nakameguro apartment feels empty."
    puts "The room is modestly decorated - the only real luxuries include a COUCH and a RECORD PLAYER."
    puts "You see there is a NOTE on the coffee table."
    puts "The FRONT DOOR adjoins the living room."

    print "> "
    living_room_action = $stdin.gets.chomp.downcase

    if living_room_action.include? "couch"
        couch
    elsif living_room_action.include? "record"
        record_player
    elsif living_room_action.include? "note"
        note
    elsif living_room_action.include? "bedroom"
      bedroom
    elsif living_room_action.include? "bathroom"
      bathroom
    elsif living_room_action.include? "kitchen"
      kitchen
    elsif living_room_action.include? "front" or living_room_action.include? "door"
      outside
    else
       puts "You stand in the living room and enjoy the warmth of the sunlight."
       puts "---"
       living_room
    end
end

def window
  if $window_count == 0
    puts "You move towards the window."
    puts "You look over at Aiko's side of the bed.  Where is she?"
    puts "The whisky glasses from last night still occupy the surface of your tiny bedside table."
    puts "Looking out of the window you see a car pass on the street below and the sakura trees by the river."
    puts "The trees are starting to blossom."
    $phone_ringing = true
    $window_count = 1
    phone
  elsif $window_count == 1
    puts "You return to the window and spend some time looking at the sakura trees again."
    puts "---"
    $window_count = 2
    bedroom
  elsif $window_count == 2
    puts "You watch two children drawing in the sand of the small playground outside the block across the street."
    puts "---"
    bedroom
  end
end

def phone
  puts ".. ..... .. ..... .. ...."
  puts "The phone in the living room spoils the silence."
  puts "Do you want to answer it?"
  print "> "

  answer_phone = $stdin.gets.chomp.downcase

  if answer_phone == "yes" || answer_phone == "y"
    phone_call
  elsif (answer_phone == "no" || answer_phone == "n") && $phone_count <= 2
    puts "You wait.  The ringing phone continues.  Who could be calling this early?"
    $phone_count += 1
    phone
  elsif (answer_phone == "no" || answer_phone == "n") && $phone_count > 2
    puts "The phone finally stops ringing."
    puts "You have a strange feeling.  Like a door once open to you is starting to close."
    puts "---"
    $phone_ringing = false
    $phone_count = 0
      if $couch == true
        living_room
      else
        bedroom
      end
  else
    phone
  end
end

def phone_call
  puts "You answer the phone in the living room."
  puts "There is a weird hiss on the line, and then..."
  puts "\t\"Hello?!\""

  print "> "
  phone_conv1 = $stdin.gets.chomp.downcase

  if phone_conv1.include? "hello" or phone_conv1.include? "hi" or phone_conv1.include? "yes"
    puts "\t\"Oh good, it's you - got you on the first try!\""
    sleep(2.3)
  else
    puts "\t\"Well that's no way to answer a telephone!\""
    sleep(2.2)
    puts "\t\"Where are your manners?\""
  end

  puts "\t\"Anyway.  Let me get to the point.\""
  sleep(2.2)
  puts "\t\"You probably have questions.  Or you will do anyway.\""
  sleep(2.3)
  puts "\t\"My advice - keep out of it.  Don't pry and things will be OK.\""
  sleep(2.4)
  puts "\t\"Otherwise...\""
  sleep(2.8)
  puts "\t\"So, tell me what I want to hear...\""

  print "> "
  phone_conv2 = $stdin.gets.chomp.downcase

  if phone_conv2.include? "ok" or phone_conv2.include? "yes" or phone_conv2.include? "sure" or phone_conv2.include? "alright" or phone_conv2.include? "fine" or phone_conv2.include? "yeah"
    puts "\t\"Great! You won't hear from us again.\""
    sleep(2.2)
    puts "\t\"Be smart, OK?  You're a man of your word I know it!\""
    sleep(2.4)
    puts "\t\"With any luck, this will be the last time we speak.  So long!\""
    sleep(3)
    puts "\a"
  elsif phone_conv2.include? "no" or phone_conv2.include? "fuck" or phone_conv2.include? "what" or phone_conv2.include? "never" or phone_conv2.include? "get"
    puts "\t\"OK, smart mouth.\""
    sleep(2.3)
    puts "\t\"If you want it the hard way, that's fine by us too.\""
    sleep(2.4)
    puts "\t\"We'll see you soon no doubt.\""
    sleep(3)
    puts "\a"
  elsif phone_conv2.include? "aiko"
    puts "\t\"Yeah, I'd forget about her if I were you.\""
    sleep(2.2)
    puts "\t\"Think about what I've said.  We don't want to have to visit, ok?\""
    sleep(2.4)
    puts "\t\"Goodbye friend.\""
    sleep(3)
    puts "\a"
  else
    puts "\t\"OK, shut up for a second asshole.\""
    sleep(2.4)
    puts "\t\"I've tried to be pleasant and helpful.\""
    sleep(2.5)
    puts "\t\"If you want it the hard way, that's fine by us too.\""
    sleep(2.4)
    puts "\t\"We'll see you around.\""
    sleep(3)
    puts "\a"
  end

    puts "You put the phone down.  What the hell was that?"
    puts "---"
  $phone_ringing = false
  $phone_count = 1
  living_room
end

def couch
  puts "You sit on the couch.  It's an old Lawson style. The material is worn but it's comfortable"
  puts "Between the cushions you notice the corner of a matchbook.  It advertises the Dolphin hotel in a clinical font."
  puts "---"
  if $phone_count == 0
    phone
    $couch = true
  else
    living_room
  end
end

def record_player
  puts "You look over at your record player.  There are a number of Jazz records sitting beside it."
  puts "---"
  living_room
end

def note
  puts "You pick up the note on the coffee table."
  puts "\t\"This is what the note says.  \n\tSomething innocuous but vaguley unsettling.\""
end

def outside
  puts "You go outside."
end

start
