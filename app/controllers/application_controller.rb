class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    get "/posts" do
      posts = Post.all.order(:posted_at)
      post.to_json
    end
    
    post "/posts" do
      post = Post.create(username: params[:username], body: params[:body])
      post.to_json
    end
    
    patch "/posts/:id" do
      post = Post.find(params[:id])
      post.update(body: params[:body])
      post.to_json
    end
    
    delete "/posts/:id" do
      post = Post.find(params[:id])
      post.destroy
      post.to_json
    end
    
  end