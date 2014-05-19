class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name, :unique => true
      t.string :project_api, :unique => true
    end
  end
end
