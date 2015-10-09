class ProjectsController < ApplicationController
  def home
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    Project.transaction do
      @project = Project.new(filter_params)
      @project.owner_id = current_user.id
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
    @funding = Funding.new
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

  def create_funding
    Funding.transaction do
      @project = Project.find(params[:id])
      @funding = Funding.new(filter_funding_params)
      @funding.user = current_user
      @funding.project = @project
      @funding.save!
    end
    redirect_to project_path(@project)
  rescue ActiveRecord::ActiveRecordError
    respond_to do |format|
      format.html { render 'show' }
    end
  end

  private

  def filter_params
    return nil unless params[:project]
    params
      .require(:project)
      .permit([:name, :description, :deadline, :target_amount])
  end

  def filter_funding_params
    return nil unless params[:funding]
    params.require(:funding).permit([:amount])
  end
end
