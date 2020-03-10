require_relative 'config/environment'

class App < Sinatra::Base

  get('/'){
    erb :user_input
  }

  get('/piglatinize'){
    erb :piglatinize
  }
  
  post('/piglatinize'){
    @piglatin_text = PigLatinizer.new.piglatinize(params[:user_phrase])
    erb :piglatinize
  }


end