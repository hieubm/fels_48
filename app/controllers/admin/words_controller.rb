class Admin::WordsController < ApplicationController
  layout "admin/admin"
  before_action :logged_in_user
  before_action :admin_user
  before_action :load_category

  def index
    @words = Word.paginate page: params[:page]
  end

  def new
    @word = Word.new
    4.times {@word.answers.build}
  end

  def create
    @word = Word.new word_params
    @word.category = @category
    if @word.save
      flash[:success] = "Word is created successfully"
      redirect_to [:admin, @category, :words]
    else
      render :new
    end
  end

  def edit
    @word = Word.find params[:id]
    @word.category = @category
  end

  def update
    @word = Word.find params[:id]
    if @word.update word_params
      flash[:success] = "Word is updated successfully"
      redirect_to [:admin, @category, :words]
    else
      render :edit
    end
  end

  def destroy
    @word = Word.find params[:id]
    @word.destroy
    flash[:success] = "Word is deleted successfully"
    redirect_to [:admin, @category, :words]
  end

  private
  def word_params
    params.require(:word).permit :content,
                                  answers_attributes: [:id, :content, :correct]
  end

  def load_category
    @category = Category.find params[:category_id]
  end
end
