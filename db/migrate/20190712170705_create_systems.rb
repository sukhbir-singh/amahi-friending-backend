class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.belongs_to :amahi_user, index: true
      t.string :api_key

      t.timestamps
    end
  end
end
