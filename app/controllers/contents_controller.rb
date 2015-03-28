class ContentsController < ApplicationController
  before_action :set_content, only: [:show]
  before_action :set_folder, only: [:create, :show]

  def show
  end

  def create
    @content = @folder.contents.build(content_params)
    @content.uploaded_by = request.remote_ip

    respond_to do |format|
      if @content.save
        format.html { redirect_to @folder, notice: 'Content was successfully created.' }
        format.json 
      else
        format.html { render :new }
        format.json { render json: @content.errors.full_messages.join(' '), status: :unprocessable_entity }
      end
    end
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def set_folder
      @folder = Folder.find_by_token(params[:folder_token])
    end
    
    def content_params
      params.require(:content).permit(:file)
    end
end
