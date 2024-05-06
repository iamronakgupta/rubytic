class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.text :test_code

      t.timestamps
    end
  end
end
