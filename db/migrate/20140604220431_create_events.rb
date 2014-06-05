class CreateEvents < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION hstore'

    create_table :events do |t|
      t.datetime :occurred_on
      t.string :user_id
      t.hstore :properties
      t.string :event_type
      t.integer :project_id
      t.index :project_id


    end
  end
end
