class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get "/" do
    end

    get "/test" do
        {hello: "testing"}.to_json
    end

    post '/signup' do
        dupeTest = User.find_by(name: params[:name])
        if (!dupeTest)
          newUser = User.create(name: params[:name])
          puts "User #{screen_name} Created!"
        else 
            puts "User already exists"
            return nil
        end
    end



end