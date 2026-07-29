class Paciente < ApplicationRecord
  has_many :atendimentos, dependent: :restrict_with_error

  before_validation :normalizar_cpf

  validates :nome_completo, presence: true
  validates :cpf,
            presence: true,
            uniqueness: true,
            length: { is: 11 },
            format: {
              with: /\A\d{11}\z/,
              message: "deve possuir 11 números"
            }

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              allow_blank: true
            }

  private

  def normalizar_cpf
    self.cpf = cpf.to_s.gsub(/\D/, "")
  end
end