class CreateNews < ActiveRecord::Migration

  def self.up
    create_table :news do |t|
      t.string :title
      t.text :text1
      t.text :text2
      t.datetime :date
      t.integer :position

      t.timestamps
    end

    add_index :news, :id

    load(Rails.root.join('db', 'seeds', 'news.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "news"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/news"})
    end

    drop_table :news
  end

end
