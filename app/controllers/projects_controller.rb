class ProjectsController < ApplicationController

    before_action :find_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @projects = Project.all.order("created_at desc")
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new project_params

        if @project.save
            redirect_to @project, notice: "Nice Mackenzie! That project was successfully saved!"
        else
            render 'new'
        end
    end

    def show
        #@post = Post.find(params[:id])
    end

    def edit
    end

    def update
        if @project.update project_params
            redirect_to @project, notice: "Nice Mackenzie! That project was successfully updated!"
        else
            render 'edit'
        end
    end

    def destroy
        find_project
        @project.destroy
      end

    private

    def find_project
        @project = Project.friendly.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title, :description, :link, :slug)
    end 
end