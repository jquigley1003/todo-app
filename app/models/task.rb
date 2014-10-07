class Task < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 254 } # or { in: 3...254 }
  validates :priority, numericality: { only_integer: true, minimum: 1, maximum: 10 }
end
