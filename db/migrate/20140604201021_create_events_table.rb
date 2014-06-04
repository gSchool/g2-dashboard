class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :project_id
      t.index :project_id
    end
  end
end
