class AddTablesToSolution2 < ActiveRecord::Migration
  def change
  	drop_table :lang_stats

    create_table :ngrams do |t|
      t.integer :lang_id
      t.string :ngram
      t.float :stats

      t.timestamps
    end
  end
end
