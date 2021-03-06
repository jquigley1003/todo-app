class User < ActiveRecord::Base
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+(?:\.[a-z\d\-]+)*\.[a-z]+/i
  validates :email,  presence: true, length: { maximum: 200 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
end
