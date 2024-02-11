module MunicipeValidations
  extend ActiveSupport::Concern

  included do
    validates :cpf, uniqueness: { case_sensitive: false }
    validates :cns, uniqueness: { case_sensitive: false }
    validates :cpf, length: { is: 11, allow_nil: true }
    validates :cns, length: { is: 15, allow_nil: true }

    validates :full_name, :cpf, :cns, presence: true
    validates :email, :birth_date, :telephone, presence: true
    validates :photo, presence: true

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    validate  :validate_cpf
    validate  :validate_cns
    validate  :validate_birth_date

    before_create :set_status
    before_destroy :remove_photo
  end

  private

  def validate_cpf
    return if cpf.blank?

    unless CPF.valid?(self.cpf)
      error_message = I18n.t("activerecord.attributes.municipe.invalid_cpf")
      self.errors.add(:cpf, error_message)
    end
  end

  def validate_cns
    return if cns.blank?

    unless cns.match?(/\A\d{15}\z/)
      error_message = I18n.t("activerecord.attributes.municipe.invalid_cns")
      self.errors.add(:cns, error_message)
    end
  end

  def validate_birth_date
    return if birth_date.blank?

    unless birth_date.is_a?(Date)
      error_message = I18n.t("activerecord.attributes.municipe.invalid_birth_date")
      errors.add(:birth_date, error_message)
    end

    unless birth_date <= Date.current
      error_message = I18n.t("activerecord.attributes.municipe.cant_be_in_the_future")
      errors.add(:birth_date, error_message)
    end

    def set_status
      self.status = true
    end

    def remove_photo
      photo.remove! if photo.present?
    end
  end
end
