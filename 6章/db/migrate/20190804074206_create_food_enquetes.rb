class CreateFoodEnquetes < ActiveRecord::Migration[5.2]
  def change
    create_table :food_enquetes do |t|
      t.string :name
      t.string :mail
      t.integer :age
      t.integer :food_id
      t.integer :score
      t.string :request
      t.integer :present_id

      t.timestamps
    end
  end
end
