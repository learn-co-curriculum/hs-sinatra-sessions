require_relative 'config/environment'

class App < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    "Welcome to Sinatra Sessions! In this lab, we will be learning about the general principles behind a sessions cookie. In order to proceed, let's go to the <a href='/first_exercise'>first_exercise</a> path."
  end

  get '/first_exercise' do
    "Your first exercise will be to set your session key-value pair. You should be able to set the session key-value pair somewhere in the app.rb file, which is currently acting as our controller. When you navigate to the <a href='/set'>/set</a> path, it should set session[:foo] equal to 'hello'."
  end

  get '/set' do
    # Implement your solution here!
    
    if session[:foo] == 'hello'
      "Session value set. It's currently set to #{session[:foo]}"
      redirect '/fetch'
    else
      "Session value has not been set. Did you add a key of :foo to the session hash and set it equal to 'hello'? Try again and refresh the page."
    end
  end

  get '/fetch' do
    "session[:foo] value: #{session[:foo]}. Awesome! That value is now stored inside of your cookie. Let's navigate to the next exercise at <a href='/second_exercise'>/second_exercise</a>."
  end

  get '/second_exercise' do
    "Your second exercise will be to set your session id key-value pair. The methodology is very similar to the first exercise. When you navigate to the <a href='/set_session'>/set_session</a> path, it should set session[:id] equal to 1.<p>Why keep track of a session id? Because we can use that id to find a User in our database.</p> "
  end

  get '/set_session' do
    # Implement your solution here!	

    if session[:id] == 1
      "Session ID set. It's currently set to #{session[:id]}."
      redirect '/fetch_session_id'
    else
      "Session ID has not been set. Be sure to set the session[:id] to 1 in the '/set_session' route and refresh this page!"
    end
  end

  get '/fetch_session_id' do
    "session[:id] value: #{session[:id]}. Awesome job! Finally, we need a way for a user to logout. Go to the <a href='logout'>/logout</a> route, where we'll clear our session.  "
  end

  get '/logout' do
    session.clear
    "Session has now been cleared using the .clear method. Our session now is an empty hash: #{session.inspect}. Continue on to the <a href='/finish'>finish</a> line!"
  end

  get '/finish' do
    "Hopefully that explains a little more about the concept of sessions. The session cookie is simply a way to store user data on a temporary basis. In any web application, a user ID is typically used as a session ID. This is because an ID attribute of a user is a unique identifier that will always be distinguishable from other user ID attributes."
  end
end
