class ChangePostsContent < ActiveRecord::Migration
  def change
    change_column :posts, :content, :text
  end
end
