# class WelcomeGreeting

#   def initilize
#     @time = (Time.now.strftime("%I").to_i)
#   end
require 'sinatra'


  def greeting(time = Time.now)
    if time.hour < 12
      greeting = 'Good Morning'
    elsif time.hour < 18
      greeting = "Good Afternoon"
    else
      greeting =  'Good Evening'
    end
    p greeting
    greeting
  end
  #code will display good morning at 12:30


#end


#put this in your server rb
get "/" do 

 @greeting = greeting

  #this goes to your views/index.erb
  erb :index
end

#in your erb

