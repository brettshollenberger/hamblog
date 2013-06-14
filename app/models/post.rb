class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates_presence_of :content
  validates_presence_of :title
  validates_presence_of :user
  belongs_to :user, {
    inverse_of: :posts
  }
end
