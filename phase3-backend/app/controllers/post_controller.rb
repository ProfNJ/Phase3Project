class PostController < ApplicationController

    get '/posts' do
    sendout = Post.all.order("date DESC")
    sendout.to_json
    end

    get '/user/:name/:id' do
        userGet = User.find_by(name: params[:name])
        post = userGet.posts.find(params[:id])
        arr = {post: post, comment: post.comments.all}
        arr.to_json
    end

end