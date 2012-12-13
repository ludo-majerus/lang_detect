class AddDimensionToNgramTable < ActiveRecord::Migration
  def change
  	    add_column :ngrams, :dimension, :integer
  end
end
