class LinksController < ApplicationController
  def index
  	@links = Link.all
  end

  def create
  	@link = Link.create(link_params)

    if @link.valid?
      flash[:success] = 'New link successfully created.'
      redirect_to root_path
    end

  	if @link.invalid?
  	  flash[:error] = 'The data you entered is invalid. Please try again.'
  	  redirect_to root_path
  	end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
