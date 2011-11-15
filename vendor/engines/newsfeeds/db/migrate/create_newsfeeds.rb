class CreateNewsfeeds < ActiveRecord::Migration

  def self.up
    create_table :newsfeeds do |t|
      t.string :title
      t.text :text1
      t.text :text2
      t.datetime :date
      t.integer :position

      t.timestamps
    end

    add_index :newsfeeds, :id

    load(Rails.root.join('db', 'seeds', 'newsfeeds.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "newsfeeds"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/newsfeeds"})
    end

    drop_table :newsfeeds
  end

end
