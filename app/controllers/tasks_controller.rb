class TasksController < ApplicationController
  before_filter :load_list

  # GET /tasks
  # GET /tasks.json
  #def index
  #  @list = Listtask.find(params[:listtask_id])
  #  @tasks = Task.find(params[@list])
  #
  #  respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @tasks }
  #  end
  #end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    # @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = @list.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @list.tasks.create_with(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to listtask_path(@list), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to listtask_path(@list), notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @list = @task.listtask
    @task.destroy

    respond_to do |format|
      format.html { redirect_to listtask_path }
      format.json { head :ok }
    end
  end

  private

  def load_list
    @task = Task.find(params[:id]) if params[:id]
    @list = Listtask.find(params[:listtask_id]) if params[:listtask_id]
  end
end
