class Admin::CategoriesController < ApplicationController
  layout "admin/admin"
  before_action :logged_in_user
  before_action :admin_user

  def index
    @categories = Category.paginate page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category is created successfully"
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update category_params
      flash[:success] = "Category is updated successfully"
      redirect_to [:admin, :categories]
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = "Category is deleted successfully"
    redirect_to [:admin, :categories]
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
end
