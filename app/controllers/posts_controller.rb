class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]

    def index
        @posts = Post.all
    end

    def show
        
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)

        if @post.valid?
            @post.save
            flash[:notice] = 'Successfully created the post!'
            redirect_to @post
    
        else
            flash[:create_errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        if @post.update(post_params)
            @post.save
            flash[:notice] = 'Successfully created the post!'
            redirect_to @post
        else
            flash[:update_errors] = @post.errors.full_messages
            render :edit
        end
    end

    def like_post
        post = Post.find(params[:id])
        post.likes += 1
        post.save

        redirect_to post_path(post)
    end

    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit!
    end
end