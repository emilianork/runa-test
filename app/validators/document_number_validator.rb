class DocumentNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value
    return unless record.document_type

    document_type = record.document_type

    begin
      return if method("#{document_type.downcase}_valid?").call(value)
    rescue NameError
    end

    record.errors.add(attribute, :invalid)
  end

  def passport_valid?(_document_number)
    true
  end

  def visa_valid?(_document_number)
    true
  end

  def curp_valid?(document_number)
    !/^([a-z]|[0-9]){18,18}$/i.match(document_number).nil?
  end
end
