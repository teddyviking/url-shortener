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
    @link = Link.find_or_create_link(permited_params)
    if @link.valid?
      redirect_to link_path(@link)
    else
      render 'new'
    end
  end

  def render_original_url
    @link = Link.find_by shortlink: params[:shortlink]
    @link.update_visits
    redirect_to @link.link
  end

  def most_visited_pages
    @most_visited_pages = Link.order(visits: :desc).limit(10) 
  end

  private

  def permited_params
    params.require(:link).permit(:link, :shortlink)   
  end
end
