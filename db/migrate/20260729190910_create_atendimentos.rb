class CreateAtendimentos < ActiveRecord::Migration[8.0]
  def change
    create_table :atendimentos do |t|
      t.references :paciente,
                   null: false,
                   foreign_key: true

      t.references :prestador,
                   null: false,
                   foreign_key: true

      t.datetime :data_hora, null: false
      t.integer :duracao, null: false
      t.string :tipo_atendimento, null: false
      t.text :observacoes
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :atendimentos, :data_hora
    add_index :atendimentos, :status
  end
end