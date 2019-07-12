class CreateAmahiUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :amahi_users do |t|
      t.string :email

      t.timestamps
    end
  end
end
