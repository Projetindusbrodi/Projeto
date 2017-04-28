class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users do |t|
      t.string :nome
      t.string :email
      t.string :password
      t.string :password_digest

      t.timestamps
    end
  end
end
