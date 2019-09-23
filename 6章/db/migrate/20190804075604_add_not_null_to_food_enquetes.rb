class AddNotNullToFoodEnquetes < ActiveRecord::Migration[5.2]
  def up
    change_column_null :food_enquetes, :name, false
    change_column_null :food_enquetes, :mail, false
    change_column_null :food_enquetes, :age, false
    change_column_null :food_enquetes, :food_id, false
    change_column_null :food_enquetes, :score, false
    change_column_null :food_enquetes, :request, false
    change_column_null :food_enquetes, :present_id, false
  end

  def down
    change_column_null :food_enquetes, :name, true
    change_column_null :food_enquetes, :mail, true
    change_column_null :food_enquetes, :age, true
    change_column_null :food_enquetes, :food_id, true
    change_column_null :food_enquetes, :score, true
    change_column_null :food_enquetes, :request, true
    change_column_null :food_enquetes, :present_id, true
  end
end
