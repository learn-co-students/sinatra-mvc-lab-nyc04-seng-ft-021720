require_relative 'config/environment'

class App < Sinatra::Base



post '/piglatinize' do

    pl = PigLatinizer.new
    piglatin_word = pl.piglatinize(params["user_phrase"])


end



get '/' do 


    erb :user_input
end 



end