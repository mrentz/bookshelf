class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.string :author
      t.belongs_to :book
      t.timestamps
    end
  end
end
