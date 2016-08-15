class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.integer :category_id
      t.string :name
      t.text :definition
      t.string :author
      t.string :resource
      t.timestamps
    end
  end
end
