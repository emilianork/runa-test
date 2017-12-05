class BirthdayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      birthday = if value.is_a?(String)
                   DateTime.parse(value)
                 else
                   value
                 end
      
      if birthday >= 18.years.ago || birthday < 100.years.ago
        record.errors.add(attribute, :invalid)
      end

    # Either value is nil, not a string or not a valid date.
    rescue ArgumentError, TypeError, NoMethodError
      record.errors.add(attribute, :invalid)
    end
  end
end
