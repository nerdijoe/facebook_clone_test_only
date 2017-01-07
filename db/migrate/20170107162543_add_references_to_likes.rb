class AddReferencesToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true, foreign_key: true
    add_reference :likes, :status, index: true, foreign_key: true
  end
end
