class Paciente < ApplicationRecord
  # Validaciones de presencia
  validates :rut, :nombres, :apellidos, :direccion, :ciudad, :telefono, :email, :fecha_nacimiento, :estado_civil, presence: true

  # Validación de unicidad para RUT
  validates :rut, uniqueness: { case_sensitive: false, message: "ya está registrado en el sistema" }

  # Validación de formato para RUT chileno (ej: 12345678-9)
  validates :rut, format: {
    with: /\A\d{1,2}\.\d{3}\.\d{3}[-][0-9kK]{1}\z|\A\d{7,8}[-][0-9kK]{1}\z/,
    message: "debe tener formato válido (ej: 12345678-9 o 12.345.678-9)"
  }

  # Validación de formato para email
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: "debe ser una dirección de correo válida"
  }

  # Validación de formato para teléfono (números, espacios, guiones y paréntesis)
  validates :telefono, format: {
    with: /\A[\d\s\-\+\(\)]+\z/,
    message: "solo puede contener números, espacios, guiones y paréntesis"
  }

  # Validación de longitud para teléfono
  validates :telefono, length: {
    minimum: 8,
    maximum: 15,
    message: "debe tener entre 8 y 15 caracteres"
  }

  # Validación de fecha de nacimiento
  validate :fecha_nacimiento_valida

  private

  def fecha_nacimiento_valida
    return if fecha_nacimiento.blank?

    if fecha_nacimiento > Date.today
      errors.add(:fecha_nacimiento, "no puede ser en el futuro")
    end

    if fecha_nacimiento < Date.today - 150.years
      errors.add(:fecha_nacimiento, "no puede ser mayor a 150 años")
    end
  end
end
