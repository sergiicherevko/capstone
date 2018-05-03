# NOTES:
# Make sure usre cannot loogin if he didn't enter correct password and login




require "unirest"
# Authorisation
system "clear"
puts "[1] Signup (create new user)"
puts "[2] Log in (if created user)"
puts "[3] Log out (if signed up user)"


user_input = gets.chomp

if user_input == "1"
  params = {}
  print "Print First Name: "
  params["first_name"] = gets.chomp

  print "Print Last Name: "
  params["last_name"] = gets.chomp

  print "Print Email: "
  params["email"] = gets.chomp
  print "Print Password: "
  params["password"] = gets.chomp
  print "Password Confirmation: "
  params["password_confirmation"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  user = response.body
  if user["errors"]
    p user["errors"]
  else
    puts "New User:"
    puts JSON.pretty_generate(user)
  end
elsif user_input == "2"
  # print "Print email: "
  # email = gets.chomp
  # print "Print password: "
  # password = gets.chomp
  response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: "sergii@email.com",
        password: "password"
        }
      }
    )
  jwt = response.body["jwt"]
  first_name = response.body["user"]["first_name"]
  Unirest.default_header("Authorization", "Bearer #{jwt}")
  puts "Welcome!"
  puts "Your JWT is #{jwt} ."                                             
elsif user_input == "3"
  jwt = ""
  Unirest.clear_default_headers() 
end   


                                                                          #Application
exit = ""
while exit != "exit"

  system "clear"
  p jwt
  puts "Welcome to 'LetsDoIt' app #{first_name}! Choose an option:"

# Unirest.patch("http://localhost:3000/v1/users/0", parameters: params) # updates current_user on backend

  puts "[1] See all users"
  puts "  [1.1] Search for user"
  puts "  [1.2] Sort by first name --- Not available yet"
  puts "  [1.3] Sort by last name --- Not available yet"
  puts "[2] See one user"
  puts "[3] Create a request"
  puts "[4] Update user personal info"
  puts "[5] Accept a request"
  puts "[6] Delete a user"

  user_input = gets.chomp

  if 
    user_input == "1"
    respose = Unirest.get("http://localhost:3000/v1/users")
    users = respose.body
    puts JSON.pretty_generate(users)
  elsif 
    user_input == "1.1"
    print "Eneter user id: "
    input_id = gets.chomp
    respose = Unirest.get("http://localhost:3000/v1/users/#{input_id}")
    user = respose.body
    puts JSON.pretty_generate(user)
  elsif 
    user_input == "1.2"
    respose = Unirest.get("http://localhost:3000/v1/users?order_by_first_name=true")
    users = respose.body
    puts JSON.pretty_generate(users)
    user_input == "1.3"
    respose = Unirest.get("http://localhost:3000/v1/users?order_by_last_name=true")
    users = respose.body
    puts JSON.pretty_generate(users)
  elsif 
    user_input == "2"  
    print "Print users id:"
    user_input_id = gets.chomp.to_i
    response = Unirest.get("http://localhost:3000/v1/users/#{user_input_id}")
    user = response.body
    puts JSON.pretty_generate(user)
  elsif 
    user_input == "3"
    params = {}  
    print "Print your user id:" #needs to be replaced with current_user
    params["user_id"] = gets.chomp.to_i
    puts "Select an event by ID: "
    response = Unirest.get("http://localhost:3000/v1/events")
    events = response.body
    events.each do |event|
      puts "Discription: #{event["description"]}"
      puts "ID: #{event["id"]}"
    end
    print "Enter the event ID: "
    params["event_id"] = gets.chomp
    print "Enter a shot message: "
    params["message"] = gets.chomp
    p params
    response = Unirest.post("http://localhost:3000/v1/requests", parameters: params)
    request = response.body
    p request
    puts "Here is your request: "
    puts JSON.pretty_generate(request)
  elsif 
    user_input == "4"
    print "Print a user id: "
    input_id = gets.chomp.to_i
    params = {}
    print "Age: "
    params["age"] = gets.chomp
    print "Height: "
    params["height"] = gets.chomp
    print "Weight: "
    params["weight"] = gets.chomp    
    print "Picture URL: "
    params["picture_url"] = gets.chomp

    puts "Choose the sports you are interested in:"
    response = Unirest.get("http://localhost:3000/v1/sports")
    sports = response.body
    sports.each do |sport|
      print "#{sport['name']} (yes/no): "
      choice = gets.chomp
      if choice == "yes"
        params = {sport_id: sport["id"], user_id: input_id}
        print "Your level: "
        params["sport_level"] = gets.chomp
        print "Summary: "
        params["summary"] = gets.chomp
        response = Unirest.post("http://localhost:3000/v1/user_sports", parameters: params)
      end
    end
    user = response.body
    if user["errors"]
      puts "Uh oh! Something went wrong..."
      p user["errors"]
    else
      puts "Here is updated user"
      puts JSON.pretty_generate(user)
    end
  elsif 
    user_input == "5"
    params = {} 
    puts "Select request by ID."
    puts "Here are all requests: "
    response = Unirest.get("http://localhost:3000/v1/requests") 
    requests = response.body
    puts JSON.pretty_generate(requests)




    print "Enter request ID: "
    request_id = gets.chomp
    params["request_id"] = request_id
    response = Unirest.patch("http://localhost:3000/v1/requests/#{request_id}", parameters: params) 





  elsif 
    user_input == "6"
    print "Print a user id: "
    input_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/users/#{input_id}")
    body = response.body
    puts JSON.pretty_generate(body)
  end 


  puts "Continue? (type [exit] to exit)."
  exit = gets.chomp
end