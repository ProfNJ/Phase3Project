class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments

    def liked
      self.likes = self.likes + 1
    end

    def trash
      self.delete
    end

  end