class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag, index: true
 	  #t.references :tagable, polymorphic: true, index: true
      t.references :post, index: true
 	  t.timestamps null: false
    end

  end
end
