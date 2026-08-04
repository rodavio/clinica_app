class Atendimento < ApplicationRecord
  belongs_to :paciente
  belongs_to :prestador

  enum :status, {
    agendado: 0,
    realizado: 1,
    cancelado: 2  }
  
  validates :paciente, presence: true
  validates :prestador, presence: true
  validates :data_hora, presence: true
  validates :duracao, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :data_hora, uniqueness: { scope: :prestador_id, message: "já possui um atendimento agendado para este prestador neste horário" }

  private
end
