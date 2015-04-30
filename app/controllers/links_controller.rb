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
  	params[:link][:link].prepend("http://") if !params[:link][:link].start_with?("http://")
    @link = Link.find_by link: params[:link][:link]
    if !@link
      @link = Link.new permited_params
      @link.generate_short_link(3)
      if @link.save
        redirect_to link_path(@link)
      else
        render 'new'
      end
    else
      redirect_to link_path(@link)
    end
  end

  def render_original_url
    @link = Link.find_by shortlink: params[:shortlink]
    @link.update_visits
    redirect_to @link.link
  end

  private

  def permited_params
    params.require(:link).permit(:link, :shortlink)   
  end
end
