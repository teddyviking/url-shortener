class LinksController < ApplicationController
  def index
  end

  def show
    @link = Link.find params[:id]
  end

  def new
  	@link = Link.new
  end

  def edit

  end

  def create
  	@link = Link.new permited_params
    @link.generate_short_link(3)
  	if @link.save
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  private

  def permited_params
    params.require(:link).permit(:link, :shortlink)   
  end
end
