class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :name, null: false, unique: true
        t.string :profile_url

        t.timestamps
    end
  end
end
