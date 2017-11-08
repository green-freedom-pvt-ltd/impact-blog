class AddUrlTitleToArticle < ActiveRecord::Migration
  def change
  	change_table :articles do |t|
      t.string :url_title
    end
  end
end
