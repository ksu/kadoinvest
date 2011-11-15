class CreateLatestnews < ActiveRecord::Migration

  def self.up
    create_table :latestnews do |t|
      t.string :title
      t.text :text1
      t.text :text2
      t.datetime :date
      t.integer :position

      t.timestamps
    end

    add_index :latestnews, :id

    load(Rails.root.join('db', 'seeds', 'latestnews.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "latestnews"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/latestnews"})
    end

    drop_table :latestnews
  end

end
