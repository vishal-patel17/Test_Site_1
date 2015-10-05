class Blog < ActiveRecord::Base

  validates :blogname, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}



end