class TextsController < ApplicationController

  # GET /learning/:lang_id/:dimension
  def learning
    lang_id = params[:lang_id].to_i
    dimension = params[:dimension].to_i

    @myText = Text.new
    myLang = Lang.find(lang_id)

  	@myText.content = File.read("tmp/fr_light.txt")

    @myText.content = @myText.content.downcase #lowercase
    @myText.content = @myText.content.gsub(/<\/?[^>]*>/, ' ') #remove HTML
    @myText.content = @myText.content.gsub(/[^[[:word:]]\s]/, '') #remove punctuation
    @myText.content = @myText.content.squish #remove extra space
    @myText.lang_id = lang_id
    length = @myText.content.length

    @ngrams = Hash.new(0)
    for i in 0..length-dimension
        substr = @myText.content[i, dimension]
        @ngrams[substr] = @ngrams[substr] +1
    end
    
    myLang.ngram.where("dimension = '" + dimension.to_s + "'").destroy_all
    @ngrams.each do |key, value|
      ngram = myLang.ngram.new
      ngram.ngram = key
      ngram.stats = value
      ngram.dimension = dimension
      ngram.save
    end

    @ngrams = Hash.new(0)

    @Allngrams = Ngram.order("stats desc")
    flash[:notice] = Lang.name + " language has been learned"

  end

end