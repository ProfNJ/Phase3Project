class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
#like the post
    def liked
      self.likes = self.likes + 1
    end
#delete the post
    def trash
      self.destroy
    end

  end