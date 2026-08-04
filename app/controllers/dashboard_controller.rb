class DashboardController < ApplicationController
  def index
    @total_pacientes = Paciente.count
    @total_prestadores_ativos = Prestador.ativo.count

    @sessoes_realizadas_no_mes =
      Atendimento.realizado.where(
        data_hora: Time.current.beginning_of_month..
                   Time.current.end_of_month
      ).count

    @proximas_sessoes =
      Atendimento
        .agendado
        .where(data_hora: Time.current..)
        .includes(:paciente, :prestador)
        .order(:data_hora)
        .limit(5)
  end
end