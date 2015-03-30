class Comment < ActiveRecord::Base
  include Wisper::Publisher

  validates :name, :body, presence: true 
  belongs_to :content 

  after_commit :publish_creation_successful, on: :create

  default_scope { order('created_at DESC') }

  Comment.subscribe(ActivityLogListener.new)

  private

  def publish_creation_successful
     broadcast(:comment_creation_succesful, self.id)
  end
end
