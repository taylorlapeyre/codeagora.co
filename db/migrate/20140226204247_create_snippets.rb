class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :description
      t.text :content
      t.boolean :public, default: true
      t.string :permalink
      t.belongs_to :user, index: true
      t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
