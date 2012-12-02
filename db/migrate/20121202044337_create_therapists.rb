class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :speciality

      t.timestamps
    end
  end
end
