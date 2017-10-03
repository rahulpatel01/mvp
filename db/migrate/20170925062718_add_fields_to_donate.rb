class AddFieldsToDonate < ActiveRecord::Migration[5.0]
  def change
    add_column :donates, :CreditCardType, :integer
    add_column :donates, :CreditCardNumber, :string
    add_column :donates, :ExpMonth, :integer
    add_column :donates, :ExpYear, :integer
    add_column :donates, :CVV, :integer
  end
end
