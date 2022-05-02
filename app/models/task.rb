class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  enum status: { yet: 0, start: 1, completion: 2 }
end
