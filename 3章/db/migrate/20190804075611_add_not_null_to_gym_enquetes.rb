class AddNotNullToGymEnquetes < ActiveRecord::Migration[5.2]
  def up
    change_column_null :gym_enquetes, :name, false
    change_column_null :gym_enquetes, :mail, false
    change_column_null :gym_enquetes, :age, false
    change_column_null :gym_enquetes, :course_id, false
    change_column_null :gym_enquetes, :score, false
    change_column_null :gym_enquetes, :request, false
    change_column_null :gym_enquetes, :present_id, false
  end

  def down
    change_column_null :gym_enquetes, :name, true
    change_column_null :gym_enquetes, :mail, true
    change_column_null :gym_enquetes, :age, true
    change_column_null :gym_enquetes, :course_id, true
    change_column_null :gym_enquetes, :score, true
    change_column_null :gym_enquetes, :request, true
    change_column_null :gym_enquetes, :present_id, true
  end
end
