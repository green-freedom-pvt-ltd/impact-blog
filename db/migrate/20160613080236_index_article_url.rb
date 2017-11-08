class IndexArticleUrl < ActiveRecord::Migration
  def change
    add_index :articles, :url_title
  end
end
