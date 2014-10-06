class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
    	t.text :description
    	t.date :deadline
    	t.boolean :completed
    	t.integer :user_id 

    	t.timestamps
    end
  end
end
