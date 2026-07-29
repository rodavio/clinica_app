json.extract! prestador, :id, :nome_completo, :especialidade, :registro_profissional, :telefone, :email, :status, :created_at, :updated_at
json.url prestador_url(prestador, format: :json)
