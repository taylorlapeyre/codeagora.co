class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :snippet, index: true
      t.belongs_to :user, index: true
      t.text :content

      t.timestamps
    end
  end
end
