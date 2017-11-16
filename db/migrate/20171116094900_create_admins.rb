class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :login
      t.string :crypted_password
      t.string :string
      t.string :password_salt
      t.string :persistence_token
      t.string :string

      t.timestamps
    end
    
    add_index :admins, :login, unique: true

  end
end
