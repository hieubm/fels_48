class LessonsController < ApplicationController
  before_action :logged_in_user

  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build user_id: current_user.id
    @words = @category.words.random_words current_user

    @words.each do |word|
      @lesson.answer_sheets.build word_id: word.id
    end
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build lesson_params
    @lesson.user = current_user

    if @lesson.save
      redirect_to [@category, @lesson]
    else
      flash[:danger] = "Something went wrong"
      redirect_to :back
    end
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  private
  def lesson_params
    params.require(:lesson).permit answer_sheets_attributes: [:word_id, :answer_id]
  end
end
