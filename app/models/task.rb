class Task < ApplicationRecord
  belongs_to :User
  validates :content, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true
  # validates :status, presence: true

  enum status: {yet: 0, start: 1, completion: 2 }
  enum priority: {低: 0, 中: 1, 高: 2 }

  scope :get_by_title, ->(title) {
    where("title like ?","%#{title}%")
  }
  scope :get_by_status, ->(status){
    where(status: status)
  }
  end
