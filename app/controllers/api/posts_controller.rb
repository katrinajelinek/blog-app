class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render "index.json.jb"
  end

  def show
    @post = Post.find(params[:id])
    render "show.json.jb"
  end

  def create
    @post = Post.new(
      title: params[:title],
      text: params[:text],
    )
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      text: params[:text],
    )
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    render json: { message: "successfully deleted" }
  end
end
