require 'sinatra'
require 'rest-client'
require 'twilio-ruby'


  def text(phonenum)
    account_sid = 'ACecb4b1f21565ecc93c2a02d93fce811d'
    auth_token = '8820720da1cae123afda99970ed76bcd'
    @client = Twilio::REST::Client.new account_sid, auth_token    
    sms = @client.account.sms.messages.create(:body => "Jenny please?! I love you <3",
        :to => phonenum,
        :from => "+441301272034")
    puts sms.from
  end


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

  def twitterscrape
    
  end

  def send_simple_message(mailaddress)
    RestClient.post "https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0"\
    "@api.mailgun.net/v2/samples.mailgun.org/messages",
    :from => "Chris Hill <excited@samples.mailgun.org>",
    :to => mailaddress,
    :subject => "Hello",
    :text => "Testing some Mailgun awesomeness!"
  end


  post '/send_simple_message' do
    send_simple_message(params[:mailaddress])
    redirect '/#contact'
  end

  post '/send_text' do
    text(params[:phonenum])
    redirect '/#contact'
  end

  get "/" do 
   @greeting = greeting
   erb :index
  end

  get "/blog" do
    erb :blog
  end

