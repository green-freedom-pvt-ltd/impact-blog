class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content
      t.text :short_description
      t.text :meta_description
      t.string :title
      t.string :banner_image
      t.references :user, index: true, foreign_key: true
      t.integer :type
      t.timestamps null: false
    end
  end
end
