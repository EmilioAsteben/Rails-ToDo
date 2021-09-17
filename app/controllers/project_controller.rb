class ProjectController < ApplicationController

  def index
    @projects = Project.all
    render json: @projects, include: 'todos'
  end

  def todos

    if params[:project_id] && params[:project_name].blank?
    
      @project = Project.find(params[:project_id])

      @todo = @project.todos.create(text: params[:task_text], isCompleted: false)
      

    elsif params[:project_id].blank? && params[:project_name]

      @project = Project.new(title: params[:project_name])
      
      if @project.save

      @project.todos.create(text: params[:task_text], isCompleted: false)

      end
    
  end
    
end



def patch 

  @project = Project.find(params[:projectid])
  @isCompleted = @project.todos.find(params[:todoid])[:isCompleted]

  
  if @todo = @project.todos.find(params[:todoid])
  @todo.update(isCompleted: !@isCompleted)

   end

 end

end
