class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_done, :mark_undone]

  # GET /tasks
  # GET /tasks.json
  def index
    @task = Task.new
    @tasks = Task.all.sort_by{|task| task.done? ? 0 : 1;}
    respond_to do |format|
      format.html {render action: 'index'}
      format.json {render json: @tasks}
    end
  end

  def done
    @task = Task.new
    @tasks = Task.select{|task| task.done?}
    respond_to do |format| 
      format.html {render 'index'}
      format.json {render json: @tasks}
    end
  end

  def undone
    @task = Task.new
    @tasks = Task.select{|task| !task.done?}
    respond_to do |format| 
      format.html {render 'index'}
      format.json {render json: @tasks}
    end
  end

  def mark_done
    if @task.mark_done
      respond_to do |format|
        format.html {redirect_to tasks_path}
        format.js
      end
    end
  end

  def mark_undone
    if @task.mark_undone
      respond_to do |format|
        format.html {redirect_to tasks_path}
        format.js
      end
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    redirect_to tasks_path
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    redirect_to tasks_path
  end

  # POST /tasks
  # POST /tasks.json
  def create
    params = task_params
    mark_done = params.delete(:mark_done) == "1"
    @task = Task.new(params)
    
    if mark_done
      @task.mark_done
    else 
      @task.mark_undone
    end

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    params = task_params
    mark_done = params.delete(:mark_done) == "1"
    if mark_done
      @task.mark_done
    else 
      @task.mark_undone
    end
    respond_to do |format|
      if @task.update(params)
        
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @id_borrar = @task.id
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :content, :completed, :mark_done)
    end
end
