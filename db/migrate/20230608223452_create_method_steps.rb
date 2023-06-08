class CreateMethodSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :method_steps do |t|
      t.string :step
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
