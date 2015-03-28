require 'rubygems'
require 'zip'

class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy, :carousel, :download_all]

  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.all
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  def new
    @folder = Folder.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def carousel
  end

  def download_all
    respond_to do |format|
      format.zip {
        headers['Cache-Control'] = 'no-cache'  

        tmp_file = Rails.root.to_s + "/tmp/#{@folder.token}" +
                   Time.now.strftime('%Y-%m-%d-%H%M%S-%N').to_s +   
                   ".zip"
        
        tmp_path = Rails.root.to_s  + "/tmp"
        zip = Zip::File.open(tmp_file, Zip::File::CREATE) 
        zip.close

        @folder.contents.each do |content|
          content.file.copy_to_local_file(:original, tmp_path)
          zip = Zip::File.open(tmp_file)
          begin
            zip.add(content.file_file_name, "#{tmp_path}/#{content.file_file_name}")
          rescue
          ensure
            zip.close
          end
        end

        send_data(File.open(tmp_file, "rb+").read, :type => 'application/zip', :disposition => 'attachment', :filename => tmp_file.to_s)
        File.delete tmp_file
      }
    end
  end  

  private
    def set_folder
      @folder = Folder.find_by_token(params[:token])
    end
    
    def folder_params
      params.require(:folder).permit(:name, :filesize_limit, :capacity, :duration)
    end
end
