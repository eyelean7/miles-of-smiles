class PackagesController < ApplicationController
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
      redirect_to  packages_path
    else
      render :new
    end
  end
private
  def package_params
    params.require(:package).permit(:name, :description, :price)
  end
end
