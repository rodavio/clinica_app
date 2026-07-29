class Prestador < ApplicationRecord
  has_many :atendimentos, dependent: :restrict_with_error

  enum :status, {
    ativo: 0,
    inativo: 1
  }

  validates :nome_completo, presence: true
  validates :registro_profissional,
            presence: true,
            uniqueness: true

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              allow_blank: true
            }
end
