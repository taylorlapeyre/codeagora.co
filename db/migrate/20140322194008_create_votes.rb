class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :snippet, index: true
      t.belongs_to :user, index: true
      t.integer :direction

      t.timestamps
    end
  end
end
