class CreateOperations < ActiveRecord::Migration

  def self.up
    create_table :operations do |t|
      t.string :title
      t.text :part
      t.integer :position

      t.timestamps
    end

    add_index :operations, :id

    load(Rails.root.join('db', 'seeds', 'operations.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "operations"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/operations"})
    end

    drop_table :operations
  end

end
