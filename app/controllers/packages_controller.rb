class PackagesController < ApplicationController
  before_action :only => [:new, :edit] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
  def index
    @packages = Package.all
  end
  def show
    @package = Package.find(params[:id])
  end
  def new
    @package = Package.new
  end
  def create
    @package = Package.new(package_params)
    if @package.save
      redirect_to  package_path(@package)
    else
      render :new
    end
  end
  def edit
    @package = Package.find(params[:id])
  end
  def update
    @package= Package.find(params[:id])
    if @package.update(package_params)
      redirect_to packages_path
    else
      render :edit
    end
  end
  def destroy
  @package = Package.find(params[:id])
  @package.destroy
  redirect_to packages_path
end
private
  def package_params
    params.require(:package).permit(:name, :description, :price)
  end
end
