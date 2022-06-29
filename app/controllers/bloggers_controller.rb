class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show]

    def index
        @bloggers = Blogger.all
    end

    def show
        
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.valid?
            @blogger.save
            flash[:notice] = 'Successfully created the blogger!'
            redirect_to @blogger
    
        else
            flash[:errors] = @blogger.errors.full_messages
            render :new
        end
    end

    private
    def set_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit!
    end
end