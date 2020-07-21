# require 'active_support/string_inquirer'
require 'attribute_inquiry/version'

begin
  # Do a simple lookup test
  Module.const_get('ActiveSupport::StringInquirer')
rescue NameError
  require 'attribute_inquiry/inquirer'
end

# Basis module for including AttributeInquiry.
#   should be required in all relevant classes, or monkey-patched
#   into some base model, such as ApplicationRecord in rails.
module AttributeInquiry
  def self.included(base)
    base.extend(ClassMethods)
  end

  # Defines base methods for use in {self.included} for extend
  module ClassMethods
    # rubocop:disable Naming/PredicateName
    # rubocop:disable Metrics/MethodLength
    def has_attribute_inquiry(*keys, **options)
      keys.each do |key|
        parent_method = if options[:activerecord_raw]
                          "read_attribute(#{key})"
                        else
                          'super'
                        end

        class_eval(
          <<-DEFINITION, __FILE__, __LINE__ + 1
            def #{key}
              ActiveSupport::StringInquirer.new(
                self.instance_variable_get('@#{key}') ||
                #{parent_method}
              )
            end
          DEFINITION
        )
      end
    end
    # rubocop:enable Naming/PredicateName
    # rubocop:enable Metrics/MethodLength
  end
end
