class CreatePacientes < ActiveRecord::Migration[8.1]
  def change
    create_table :pacientes do |t|
      t.string :nome_completo, null: false
      t.date :data_nascimento
      t.string :cpf, null: false
      t.string :telefone
      t.string :email
      t.text :endereco

      t.timestamps
    end

    add_index :pacientes, :cpf, unique: true

  end
end
