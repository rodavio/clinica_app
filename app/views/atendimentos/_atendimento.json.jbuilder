json.extract! atendimento, :id, :paciente_id, :prestador_id, :data_hora, :duracao, :tipo_atendimento, :observacoes, :status, :created_at, :updated_at
json.url atendimento_url(atendimento, format: :json)
