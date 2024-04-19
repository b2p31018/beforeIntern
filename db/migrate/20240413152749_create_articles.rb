class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, limit: 10, null: false
      t.text :content, null: false
      t.binary :image, limit: 5.megabytes

      t.timestamps
    end
  end
end
