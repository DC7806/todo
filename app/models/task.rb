class Task < ApplicationRecord

  validates :title, :description, :end_at, presence: true

  enum status: [:pending, :ongoing, :finished]
  enum priority: [:low, :medium, :high] 

end