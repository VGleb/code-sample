class CreateFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :filters do |t|
      t.belongs_to :user
      t.jsonb :params
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
