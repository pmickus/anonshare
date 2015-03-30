class Folder < ActiveRecord::Base
  include Tokenable

  validates :filesize_limit, inclusion: { in: [5, 25, 50, 100, 500, 1000, 2000],
    message: "%{value} is not a valid size" }

  validates :capacity, inclusion: { in: [1, 10, 25, 50, 100],
    message: "%{value} is not a valid size" }
 
  validates :duration, inclusion: { in: [1, 7, 30, 365],
    message: "%{value} is not a valid size" }
  
  validates :name, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }

  validates :filesize_limit, :capacity, :duration, :name, presence: true
 
  has_many :contents
  has_many :comments, through: :contents
  has_many :activity_logs, class_name: "ActivityLog"

  before_create :set_expires_at

  def cache_key
    "#{self.id}_#{self.updated_at.to_s}_#{self.contents.first.id}_#{self.comments.first.id}"
  end

  def to_param
    token
  end

  def total_size
    contents.sum(:file_file_size)
  end

  def images
    contents.where(file_type: "image")
  end

  def videos
    contents.where(file_type: "video")
  end

  protected

  def set_expires_at
    self.expires_at = Time.now + duration.days
  end
end
