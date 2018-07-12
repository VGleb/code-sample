class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :city
      t.string :title
      t.string :address
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
