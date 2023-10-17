class CreateContactForms < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :message
      t.string :recto_id
      t.string :verso_id
      t.string :receipt
      t.string :rna_number

      t.timestamps
    end
  end
end
