class CreateEventTopicTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_topic_types do |t|
      t.string :name
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
