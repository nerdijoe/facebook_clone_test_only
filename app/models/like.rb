class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :status

  validates :user_id, presence: true
  validates :status_id, presence: true
  validates_uniqueness_of   :status_id, scope: :user_id

end
