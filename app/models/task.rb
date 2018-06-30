class Task < ApplicationRecord

  validates :title, :description, :end_at, presence: true

end