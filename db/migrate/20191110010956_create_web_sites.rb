class CreateWebSites < ActiveRecord::Migration[6.0]
  def change
    create_table :web_sites do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :shorted_url, null: false
      t.integer :counter, default: 1

      t.timestamps
    end

    add_index :web_sites, :url
  end
end
