class Comment < ActiveRecord::Base

  validates :name, :body, presence: true 
  belongs_to :content 
end
