class LinksController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@link = Link.new
  end

  def edit
  end

  def create
  	@link = Link.new
  	@link.shortlink = generate_short_link
  end
end
