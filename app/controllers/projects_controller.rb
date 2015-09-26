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
    redirect_to projects_path
  rescue ActiveRecord::ActiveRecordError
    respond_to do |format|
      format.html { render 'new' }
    end
  end

  def show
  	@project = Project.find(params[:id])
  end

  private
  def filter_params
    return nil unless params[:project]
    params.require(:project).permit([:name, :description, :deadline, :target_amount])
  end
end
