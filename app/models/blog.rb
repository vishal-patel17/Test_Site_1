class Blog < ActiveRecord::Base

  belongs_to :user

  validates :user_id, presence: true
  validates :blogname, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: {minimum: 20, maximum: 5000}

  mount_uploader :picture, PictureUploader
  validate :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture,'Should be less than 5MB')
    end
    end



end