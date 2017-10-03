class CreateTutorAssistants < ActiveRecord::Migration[5.0]
  def change
    create_table :tutor_assistants do |t|
      t.text :questions

      t.timestamps
    end
    add_column :tutor_assistants, :user, :integer
    add_index  :tutor_assistants, :user
  end
end
