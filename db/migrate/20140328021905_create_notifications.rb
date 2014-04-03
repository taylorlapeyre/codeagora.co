class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.boolean :unread, default: true
      t.text :content

      t.timestamps
    end
  end
end
