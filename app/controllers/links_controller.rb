class LinksController < ApplicationController
    def new
        render :new # renders new.html.erb
    end

    def create
        find_desc = params[:find_desc] ? params[:find_desc].downcase : nil
        loc = params[:loc] ? params[:loc].downcase : nil

        @link = Link.find_by(find_desc: find_desc, loc: loc)
        if @link.nil?
            @link = Link.new(find_desc: find_desc, loc: loc)
        end

        if @link.save
            render json: {short_url: "#{request.base_url}/#{@link.slug}"}, status: :ok
        else
            render json: {message: 'could not create link'}, status: 500
        end
    end

    def show
        @link = Link.find_by(slug: params[:slug]) # must use @-prefixed variables to be able to reference them in templates
        if !@link
            flash[:error] = "Oops, we don't have a record for #{request.base_url}/#{params[:slug]}"
            redirect_to action: 'new'
        else
            # TODO @hwang change this to "render :show" to render the show page instead of redirecting right away
            # redirect_to "http://yelp.com/search?find_desc=#{@link.find_desc}&loc=#{@link.loc}"
            render :show
        end
    end
end