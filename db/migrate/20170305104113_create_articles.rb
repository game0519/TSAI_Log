class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    drop_table :articles
    create_table :articles do |t|
      t.string :art_title
      t.string :art_subtitle
      t.string :art_cat_id
      t.string :art_pic
      t.text :art_content
      t.string :art_preview

      t.timestamps
    end
  end
end
