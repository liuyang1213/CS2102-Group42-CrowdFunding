class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    Project.transaction do
      @project = Project.new(filter_params)
      @project.owner_id = 1
      @project.save!
    end
    redirect_to project_path(@project.id)
  rescue ActiveRecord::ActiveRecordError
    respond_to do |format|
      format.html { render 'new' }
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    Project.transaction do
      @project = Project.find(params[:id])
      @project.update_attributes(filter_params)
      @project.save!
    end
    redirect_to project_path(@project.id)
  rescue ActiveRecord::ActiveRecordError
    respond_to do |format|
      format.html { render 'edit' }
    end
  end

  def destroy
    Project.transaction do
      @project = Project.find(params[:id])
      @project.destroy!
    end
    redirect_to projects_path
  rescue ActiveRecord::ActiveRecordError
    respond_to do |format|
      format.html { render 'show' }
    end
  end

  private
  def filter_params
    return nil unless params[:project]
    params.require(:project).permit([:name, :description, :deadline, :target_amount])
  end
end
