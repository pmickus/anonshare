class Content < ActiveRecord::Base
  include Wisper::Publisher

  has_attached_file :file, styles: { thumb: { :geometry => "200x200>", :format => 'png' }}, 
                           processors: lambda { |a| a.video? ? [:ffmpeg] : [:thumbnail] }, 
                           default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :file, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/]
  validates :folder, :file, :uploaded_by, :file_type, presence: true
 
  validate :file_size_constraints, :folder_size_constraints

  has_many :comments
  belongs_to :folder

  before_validation :set_file_type
  after_commit :publish_creation_successful, on: :create

  default_scope { order('created_at DESC') }

  Content.subscribe(ActivityLogListener.new)
 
  def video?
    self.file_content_type.include?("video")
  end

  def hidden_ip
    uploaded_by.split(".")[0..2].join(".") + ".xxx" 
  end

  protected

  def set_file_type
    if file_content_type.nil?
      self.file_type = ""
      return
    end

    if file_content_type.include?("image")
      self.file_type = "image"
    elsif file_content_type.include?("video")
      self.file_type = "video"
    end
  end

  private

  def file_size_constraints 
    if file_file_size.nil? 
      return
    end
  
    if file_file_size > folder.filesize_limit.megabytes 
      errors.add(:file, "size exceeds folder limits.")
    end 
  end
  
  def folder_size_constraints
    if file_file_size.nil?
      return
    end

    if (file_file_size + folder.total_size)  > folder.capacity.gigabytes
      errors.add(:file, "exceeds folder capacity limit.")
    end
  end
 
  def publish_creation_successful
    broadcast(:content_creation_succesful, self.id)
  end
end
