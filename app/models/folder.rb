class Folder < ActiveRecord::Base
  include Tokenable

  validates :filesize_limit, inclusion: { in: [5, 25, 50, 100, 500],
    message: "%{value} is not a valid size" }

  validates :capacity, inclusion: { in: [1, 10, 25, 50, 100],
    message: "%{value} is not a valid size" }
 
  validates :duration, inclusion: { in: [1, 7, 30, 365],
    message: "%{value} is not a valid size" }
  
  validates :name, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }

  validates :filesize_limit, :capacity, :duration, :name, presence: true
 
  has_many :contents

  before_create :set_expires_at

  def to_param
    token
  end

  def total_size
    contents.sum(:file_file_size)
  end
  
  protected

  def set_expires_at
    self.expires_at = Time.now + duration.days
  end
end
