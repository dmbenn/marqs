class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many   :likes
  has_one :user, through: :topic
 
    
end
