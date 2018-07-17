class CreateFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :filters do |t|
      t.string :hashsum, index: true
      t.jsonb :params
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
