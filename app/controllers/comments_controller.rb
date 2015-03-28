class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  before_action :set_content, only: [:index, :show, :create]

  def index
    @comments = @content.comments 
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @content.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to folder_content_comments_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def set_content
      @content = Content.find(params[:content_id]) 
    end
 
    def comment_params
      params.require(:comment).permit(:name, :body)
    end
end
