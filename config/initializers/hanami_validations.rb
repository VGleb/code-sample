require 'hanami/validations/form'

module ApplicationPredicates
  include Hanami::Validations::Predicates

  self.messages_path = Rails.root.join('config/locales/predicates.yml')

  predicate(:city_exists?) do |city_id|
    ::City.where(id: city_id).exists?
  end
end
