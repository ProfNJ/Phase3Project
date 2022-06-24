class PostController < ApplicationController

    get '/posts' do
        Post.all.to_json
    end

    get '/post/:id' do
        post = Post.find(params[:id])
        arr = {post: post, comment: post.comments.all}
        arr.to_json
    end

end