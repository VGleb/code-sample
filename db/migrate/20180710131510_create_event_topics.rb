class CreateEventTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :event_topics do |t|
      t.belongs_to :event
      t.belongs_to :event_topic_type
      t.string :title
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
