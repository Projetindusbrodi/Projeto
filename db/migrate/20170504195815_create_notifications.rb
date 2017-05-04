class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :produto, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
