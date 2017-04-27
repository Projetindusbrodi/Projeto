class CreateAlunos < ActiveRecord::Migration[5.0]
  def change
    create_table :alunos do |t|
      t.integer :ra
      t.string :nome
      t.string :password

      t.timestamps
    end
  end
end
