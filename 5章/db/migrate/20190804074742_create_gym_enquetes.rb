class CreateGymEnquetes < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_enquetes do |t|
      t.string :name
      t.string :mail
      t.integer :age
      t.integer :course_id
      t.integer :score
      t.string :request
      t.integer :present_id

      t.timestamps
    end
  end
end
