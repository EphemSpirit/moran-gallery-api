class Api::V1::BlogsController < ApplicationController
    before_action :check_admin, except: %i[index]

    def index
        @blogs = Blog.all
        render json: @blogs, status: :ok
    end

    def create
        @blog = current_user.blogs.build(blog_params)
        if @blog.save
            render json: @blog, status: :ok, message: "Blog posted!"
        else
            render json: @blog.errors, status: :unprocessable_entity, message: "Blog was unable to post"
        end
    end

    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            render json: @blog, status: :ok, message: "Blog updated!"
        else
            render json: @blog.errors, status: :unprocessable_entity, message: "Blog was unable to be updated"
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        render json: { status: :ok, message: "Blog deleted!" }
    end

    private

    def blog_params
        params.require(:blog).permit(:user_id, :content)
    end
end