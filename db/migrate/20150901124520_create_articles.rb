class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :slug, null: false
      t.string :language, null: false
      t.string :source
      t.string :source_url
      t.string :category, null: false
      t.string :section
      t.string :title, null: false
      t.text :description, null: false
      t.text :images, null: false
      t.text :intro, null: false
      t.text :body, null: false
      t.string :author
      t.date :written_on, null: false
      t.integer :origin_id
      t.integer :uk_translation_id
      t.integer :ru_translation_id
      t.integer :en_translation_id

      t.timestamps null: false
    end

    add_index :articles, :slug
    add_index :articles, :language
    add_index :articles, :source
    add_index :articles, :category
    add_index :articles, :section
    add_index :articles, :body, type: :fulltext unless ENV['TRAVIS'] == 'true'
    add_index :articles, :origin_id
    add_index :articles, :uk_translation_id
    add_index :articles, :ru_translation_id
    add_index :articles, :en_translation_id
  end
end
