class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.all
    @category = params[:category_id].blank? ? Category.first : Category.find(params[:category_id])

    @filter = params[:filter] ? params[:filter] : "all"
    if !@filter.blank? && ["learned_words", "not_learned_words"].include?(@filter)
      @words = @category.words.send @filter, current_user
    else
      @words = @category.words
    end
  end
end
