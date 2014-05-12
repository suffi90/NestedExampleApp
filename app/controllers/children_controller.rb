class ChildrenController < ApplicationController

  def index
    @parent= Parent.find(params[:parent_id])
    @children = @parent.children.all
  end


  def show
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
  end

  def new
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.new
  end

  def edit
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
  end

  def create
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.new(child_params)

      if @child.save
        redirect_to [@parent, @child], notice: 'Child was successfully created.'
      else
        render action: 'new'
      end
  end


  def update
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
      if @child.update(child_params)
        redirect_to [@parent, @child], notice: 'Child was successfully updated.'
      else
       render action: 'edit'
      end
  end


  def destroy
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.find(params[:id])
    @child.destroy
    redirect_to parent_children_path(@parent)
  end

  private
    def child_params
      params.require(:child).permit(:name)
    end
end
