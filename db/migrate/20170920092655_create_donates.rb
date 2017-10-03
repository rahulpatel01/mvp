class CreateDonates < ActiveRecord::Migration[5.0]
  def change
    create_table :donates do |t|
      t.integer :amount
      t.integer :amount_type

      t.timestamps
    end
    add_reference :donates, :user, index: true
  end
end
