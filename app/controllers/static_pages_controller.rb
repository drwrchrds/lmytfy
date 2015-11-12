class StaticPagesController < ApplicationController
  def root
    render :root # renders root.html.erb
  end
  
  def create_link
    render json: 'hello'
  end
  
  def show_links
    # @link = Link.find_by_slug(params[:slug]) # must use @-prefixed variables to be able to reference them in templates
    # if !@link
    #   redirect_to action: 'root'
    # end
    @slug = params[:slug]
    @params = params
    render :show_link # renders show_link.html.erb
  end
end