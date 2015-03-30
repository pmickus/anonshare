class ActivityLog < ActiveRecord::Base

  self.table_name = "activity_logs"

  belongs_to :folder

  def content_creation_succesful(content_id)
    log = ActivityLog.new
    content = Content.find(content_id)
    log.folder_id = content.folder.id
    log.model_type = "content"
    log.model_id = content.id 
    log.action = "created"
    log.save!
  end

  def comment_creation_succesful(comment_id)
    log = ActivityLog.new
    comment = Comment.find(comment_id)
    log.folder_id = comment.content.folder.id
    log.model_type = "comment"
    log.model_id = comment.id
    log.action = "created"
    log.save!
  end
    
  def item
    @item ||= self.model_type.capitalize.constantize.find(self.model_id)
  end
end
