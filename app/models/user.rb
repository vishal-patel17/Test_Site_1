class User < ActiveRecord::Base

  has_many :blogs

  before_save {self.email = email.downcase}

  validates :username,presence: true, length: {minimum: 3, maximum: 50}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
             uniqueness: {case_sensitive: false}, format:{with: VALID_EMAIL_REGEX}
end