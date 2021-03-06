class TreesController < ApplicationController

  before_action :set_tree

  def show
    render json: @tree.tree
  end

  def parent
    parent = params[:parent_id] && @tree.parent(params[:parent_id].to_i)
    render_json(parent)
  end

  def child
    child = params[:child_id] && @tree.child(params[:child_id].to_i)
    render_json(child)
  end

  private

  def render_json(json)
    if json
      render json: json
    else
      head 404
    end
  end

  def set_tree
    @tree = GetTree.new.tree
    if @tree.id != params[:id].to_i
      head 404
    end
  end
end
