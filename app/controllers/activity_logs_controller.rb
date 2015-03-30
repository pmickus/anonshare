class ActivityLogsController < ApplicationController
  before_action :set_folder

  def index
    @logs = @folder.activity_logs
  end

  private

  def set_folder
    @folder = Folder.find_by_token(params[:token])
  end
end
