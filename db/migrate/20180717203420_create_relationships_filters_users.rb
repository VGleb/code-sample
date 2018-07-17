class CreateRelationshipsFiltersUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships_filters_users do |t|
      t.belongs_to :filter, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.timestamps
    end

    add_index(
      :relationships_filters_users,
      %i(filter_id user_id),
      name: :relationships_filters_users_on_ids
    )
  end
end
