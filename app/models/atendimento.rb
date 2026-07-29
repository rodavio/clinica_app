class Atendimento < ApplicationRecord
  belongs_to :paciente
  belongs_to :prestador
end
