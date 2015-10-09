class CreateFundings < ActiveRecord::Migration
  def change
    create_table :fundings do |t|
    	t.integer :user_id, null: false, references: :user
      t.integer :project_id, null: false, references: :project

      t.integer :amount, null: false

      t.timestamps
    end
  end
end