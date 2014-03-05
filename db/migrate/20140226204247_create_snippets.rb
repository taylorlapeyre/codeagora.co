class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :description
      t.boolean :public
      t.string :permalink
      t.belongs_to :user, index: true
      t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
