class User < ::ApplicationModel
  authenticates_with_sorcery!

  enum role: %i[customer administrator]

  has_many :relationships_filters_users, class_name: 'Relationships::FiltersUsers'
  has_many :filters, through: :relationships_filters_users
end
