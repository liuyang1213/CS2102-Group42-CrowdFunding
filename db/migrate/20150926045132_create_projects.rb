class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name, null: false
    	t.string :description
    	t.datetime :deadline
    	t.integer :target_amount

    	t.integer :owner_id, null: false
        t.foreign_key :users, column: :owner_id, dependent: :delete

        t.timestamps
    end
  end
end
