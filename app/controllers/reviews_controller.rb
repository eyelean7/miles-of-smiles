class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  def new
    @package = Package.find(params[:package_id])
    @review = @package.reviews.new
  end
  def create
    @package = Package.find(params[:package_id])
    @review = @package.reviews.new(review_params)
    @review.user = current_user

    binding.pry
    if @review.save
      redirect_to package_path(@review.package)
    else
      render :new
    end
  end
  def edit
    @package = Package.find(params[:package_id])
    @review = Review.find(params[:id])
  end
  def update
    package = Package.find(params[:package_id])
    @review= Review.find(params[:id])
    if @review.update(review_params)
      redirect_to package_path(package)
    else
      render :edit
    end
  end
  def destroy
    @package = Package.find(params[:package_id])
    @package.destroy
    redirect_to packages_path
  end

private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
