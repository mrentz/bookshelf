class AddAdminToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :admin, index: true 
    add_foreign_key :books, :admins
  end
end
