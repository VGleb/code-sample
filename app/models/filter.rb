class Filter < ::ApplicationModel
  has_many :relationships_filters_users, class_name: 'Relationships::FiltersUsers'
  has_many :users, through: :relationships_filters_users
end
