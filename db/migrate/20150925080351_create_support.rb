class CreateSupport < ActiveRecord::Migration
  def change
    create_table :support do |t|
      t.string :language, null: false
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description
      t.text :body, null: false

      t.timestamps null: false
    end

    add_index :support, :language
    add_index :support, :slug
    add_index :support, [:language, :slug], unique: true
    add_index :support, :body, type: :fulltext unless ENV['TRAVIS'] == 'true'
  end
end
