class ActivityLog < ActiveRecord::Base

  self.table_name = "activity_logs"

  belongs_to :folder

  default_scope { order('created_at DESC') }

  def item
    @item ||= self.model_type.capitalize.constantize.find(self.model_id)
  end
end
