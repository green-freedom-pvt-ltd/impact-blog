class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :email, index: true, unique: true
      t.integer :status, default: 1
      t.timestamps null: false
    end
  end
end
