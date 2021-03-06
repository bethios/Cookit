class AdvertisementsController < ApplicationController
  def index
    @advertisement = Advertisement.all
  end

  def show
    @advertisement= Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]

    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      flash.now[:alert] = "There was an error saving the advertisements. Please try again."
      render :new
    end
  end
end
