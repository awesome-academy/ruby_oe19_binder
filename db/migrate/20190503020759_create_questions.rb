class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :noi_dung
      t.boolean :importance

      t.timestamps
    end
  end
end
