class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :occurred_on
      t.string :event_type
      t.string :properties
      t.integer :api_project_id
      t.index :api_project_id
    end
  end
end
