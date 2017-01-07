class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :content
      t.string :title

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
