class ApplicationValidator
  include Hanami::Validations
  include Hanami::Validations::Form

  messages :i18n

  predicates ::ApplicationPredicates
end
