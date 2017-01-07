class Status < ActiveRecord::Base
  belongs_to :user
  has_many :likes, :dependent => :destroy

  validates :title, presence: true
  validates :content, presence: true

  validates :title, length: { minimum: 8, message: "title is too short"}
  validates :content, length: { minimum: 10, message: "content is too short" }

  default_scope -> { order(:created_at => :desc) }

end
