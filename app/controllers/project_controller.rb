require_relative "../../lib/post_data.rb"


class ProjectController < ApplicationController

  def index
    @projects = Project.all
    render json: @projects, include: 'todos'
  end

  def todos

    if params[:project_id] && params[:project_name].blank? && params[:task_text]
    
      @project = Project.find(params[:project_id])

      render json: @todo = @project.todos.create(text: params[:task_text], isCompleted: false)
      

    elsif params[:project_id].blank? && params[:project_name] && params[:task_text]


       @project = Project.new(title: params[:project_name])
      
      if @project.save

        @data = PostData.new()

        @data.todo = @project.todos.create(text: params[:task_text], isCompleted: false)
        @data.category_title = Project.find(@data.todo.project_id).title
      
        render json: @data

      end
    
  end
    
end


def patch 

  @project = Project.find(params[:projectid])
  @isCompleted = @project.todos.find(params[:todoid])[:isCompleted]

  
  if @todo = @project.todos.find(params[:todoid])
 render json: @todo.update(isCompleted: !@isCompleted)

   end

 end

end
