class Relationships::FiltersUsers < ::ApplicationRelationship
  belongs_to :filter
  belongs_to :user
end
