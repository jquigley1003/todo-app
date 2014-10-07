class Task < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 254 } # or { in: 3...254 }
end
