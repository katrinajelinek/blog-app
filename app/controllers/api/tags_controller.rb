class Api::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render "index.json.jb"
  end

  def show
    @tag = Tag.find(params[:id])
    render "show.json.jb"
  end

  def create
    @tag = Tag.new(
      { tag: params[:tag] }
    )
    if @tag.save
      render "show.json.jb"
    else
      render json: { errors: @tag.errors.full_messages }
    end
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(
      tag: params[:tag],
    )
    if @tag.save
      render "show.json.jb"
    else
      render json: { errors: @tag.errors.full_messages }
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    render json: { message: "succesfully deleted" }
  end
end
