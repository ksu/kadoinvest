class AddShorttextField < ActiveRecord::Migration
  def self.up
    add_column :operations, :shorttext, :text
  end

  def self.down
    remove_column :operations, :shorttext
  end
end
