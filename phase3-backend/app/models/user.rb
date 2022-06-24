require 'date'

class User < ActiveRecord::Base
    has_many :posts
    has_many :comments, through: :posts

    def write_post(content)
      today = Date.today
      today_string = "#{today.year}-#{today.month}-#{today.day}"
      Post.create(user_id: self.id, date: DateTime.now, content: content, likes: 0)
      puts "Posted! at #{today_string}"
    end

    def write_comment(content, post_id)
      today = Date.today
      today_string = "#{today.year}-#{today.month}-#{today.day}"
      Comment.create(user_id: self.id, post_id: post_id, date: DateTime.now, content: content)
      puts "Replied! at #{today_string}"
    end
    
#return most liked post
    def highlight
      hits = self.posts.where("likes > ?", 0).order('likes DESC')
      return hits.first
    end





  end