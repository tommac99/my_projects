module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        projects = Project.all
      
        render json: ProjectSerializer.new(projects).serialized_json
      end

      def show
        project = Project.find_by(slug: params[:slug])

        render json: ProjectSerializer.new(projects).serialized_json
      end

      def create
        project = Project.new(project_params)
        
        if project.save
          render json: ProjectSerializer.new(projects).serialized_json
        else
          render json: {error: project.errors.messages}, status: 442
        end
      end

      def update
        project = Project.find_by(slug: params[:slug])
        
        if project.update(project_params)
          render json: ProjectSerializer.new(projects).serialized_json
        else
          render json: {error: project.errors.messages}, status: 442
        end
      end

      def destroy
        project = Project.find_by(slug: params[:slug])
        
        if project.desctroy
          head :no_content
        else
          render json: {error: project.errors.messages}, status: 442
        end
      end

      private

      def project_params
        params.require(:project).permit(:name, :project_url)
      end

    end
  end
end
