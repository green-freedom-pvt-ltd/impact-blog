class AddingStatusToArticle < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.integer :status, default: 1
    end
  end
end
