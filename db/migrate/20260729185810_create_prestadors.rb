class CreatePrestadors < ActiveRecord::Migration[8.1]
  def change
    create_table :prestadors do |t|
      t.string :nome_completo, null: false
      t.string :especialidade
      t.string :registro_profissional, null: false
      t.string :telefone
      t.string :email
      t.integer :status, null: false, default: 0

      t.timestamps
    end
    
    add_index :prestadors, :registro_profissional, unique: true

  end
end
