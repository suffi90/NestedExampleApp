class ParentsController < ApplicationController

  def index
    @parents = Parent.all
  end

  def show
    @parent = Parent.find(params[:id])
  end

  def new
    @parent = Parent.new
  end

  def edit
    @parent = Parent.find(params[:id])
  end


  def create
    @parent = Parent.create(params[:parent].permit(:name, :children_attributes=>[:name]))
    if @parent.save
      redirect_to @parent, notice: 'Parent was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    @parent = Parent.find(params[:id])
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'Parent was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    redirect_to parents_url
  end

  private
    def parent_params
      params.require(:parent).permit(:name)
    end
end
