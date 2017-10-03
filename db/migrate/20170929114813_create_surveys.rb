class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.references :subject, :index => true
      t.string :category
      t.integer :experience
      t.string :bubble_option
      t.string :media
      t.string :skills
      t.string :reason

      t.timestamps
    end
  end
end
