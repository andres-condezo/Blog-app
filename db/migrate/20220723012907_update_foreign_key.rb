class UpdateForeignKey < ActiveRecord::Migration[7.0]
  def change
    def change
      remove_foreign_key :likes, :posts
      add_foreign_key :likes, :posts, on_delete: :cascade
      remove_foreign_key :comments, :posts
      add_foreign_key :comments, :posts, on_delete: :cascade
    end
  
  end
end
