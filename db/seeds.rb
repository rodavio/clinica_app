User.find_or_create_by!(
  email_address: "admin@clinica.com"
) do |user|
  user.name = "Administrador"
  user.password = "123456"
  user.password_confirmation = "123456"
end

prestador = Prestador.find_or_create_by!(
  registro_profissional: "CRP-12345"
) do |registro|
  registro.nome_completo = "Maria da Silva"
  registro.especialidade = "Psicologia"
  registro.telefone = "(41) 99999-9999"
  registro.email = "maria@clinica.com"
  registro.status = :ativo
end

paciente = Paciente.find_or_create_by!(
  cpf: "12345678901"
) do |registro|
  registro.nome_completo = "João Souza"
  registro.data_nascimento = Date.new(1995, 5, 10)
  registro.telefone = "(41) 98888-8888"
  registro.email = "joao@email.com"
  registro.endereco = "Rua Exemplo, 123"
end

Atendimento.find_or_create_by!(
  paciente: paciente,
  prestador: prestador,
  data_hora: 2.days.from_now.change(hour: 14)
) do |atendimento|
  atendimento.duracao = 60
  atendimento.tipo_atendimento = "Consulta"
  atendimento.observacoes = "Primeiro atendimento."
  atendimento.status = :agendado
end