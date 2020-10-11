class RemoveContentFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :content, :text
  end

  # def up (migrateしたときに実行される)
  #   remove_column :articles, :content
  # end

  # def down (rollbackしたときに実行される)
  #   add_column :articles, :content, :text
  # end
end
