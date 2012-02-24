class ListtasksController < ApplicationController
  before_filter :load_project_list

  # GET /listtasks/1
  # GET /listtasks/1.json
  def show
    if params[:status]
      @tasks = @listtask.tasks.where('state = ?', params[:status]). order('priority')
    else
      @tasks = @listtask.tasks.order('priority')
    end

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @listtask }
    end
  end

  # GET /listtasks/new
  # GET /listtasks/new.json
  def new
    @listtask = Listtask.new

    respond_to do |format|
      format.html # _login_form.html.haml
      format.json { render json: @project.listtask }
    end
  end

  # GET /listtasks/1/edit
  def edit
    @listtask = Listtask.find(params[:id])
  end

  # POST /listtasks
  # POST /listtasks.json
  def create
    @listtask = @project.listtasks.create(params[:listtask])

    respond_to do |format|
      if @listtask.save
        format.html { redirect_to project_listtask_path(@project, @listtask), notice: 'Listtask was successfully created.' }
        format.json { render json: project_listtask_path(@project, @listtask), status: :created, location: @listtask }
      else
        flash[:error] = "Name of listtask can't be blank'"
        format.html { render action: "new" }
        format.json { render json: @listtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listtasks/1
  # PUT /listtasks/1.json
  def update
    respond_to do |format|
      if @listtask.update_attributes(params[:listtask])
        format.html { redirect_to project_listtask_path(@project, @listtask), notice: 'Listtask was successfully updated.' }
        format.json { head :ok }
      else
        flash[:error] = "Name of listtask can't be blank"
        format.html { render action: "edit" }
        format.json { render json: @listtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listtasks/1
  # DELETE /listtasks/1.json
  def destroy
    @listtask.destroy

    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: "Listtask was successfully deleted" }
      format.json { head :ok }
    end
  end

  private

  def load_project_list
    @listtask = Listtask.find(params[:id]) if params[:id]
    @project = Project.find(params[:project_id]) if params[:project_id]
  end
end
