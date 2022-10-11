class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true 
end
