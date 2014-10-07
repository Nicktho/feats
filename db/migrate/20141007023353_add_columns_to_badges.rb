class AddColumnsToBadges < ActiveRecord::Migration
  def change
  	add_column :badges, :condition_variable, :string
  	add_column :badges, :condition_operator, :string
  	add_column :badges, :condition_value, :string
  end
end
