class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :content
      t.integer :lang_id

      t.timestamps
    end
    create_table :langs do |t|
      t.string :name

      t.timestamps
    end
    create_table :lang_stats do |t|
      t.integer :lang_id
      t.string :ngram
      t.float :stats

      t.timestamps
    end
  end
end

