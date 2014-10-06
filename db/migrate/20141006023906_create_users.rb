class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	t.string :password_digest
    	t.string :theme_option
    	t.text :image
    	t.integer :xp 
    	t.integer :level

    	t.timestamps

    end
  end
end
