class UserController < ApplicationController

    get '/users' do
        User.all.to_json
    end

    post '/user/:name' do
        user = User.find_by(name: params[:name])
        arr = {user: user, posts: user.posts.all}
        arr.to_json
    end

    
 

end