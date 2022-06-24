class UserController < ApplicationController

    get '/users' do
        User.all.to_json
    end

    get '/user/:id' do
        user = User.find(params[:id])
        arr = {user: user, posts: user.posts.all}
        arr.to_json
    end

end