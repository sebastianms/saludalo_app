class CausesController < ApplicationController
  # GET /causes
  # GET /causes.json
  def index
    @causes = Cause.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @causes }
    end
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
    @cause = Cause.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/new
  # GET /causes/new.json
  def new
    @cause = Cause.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/1/edit
  def edit
    @cause = Cause.find(params[:id])
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = Cause.new
    @cause.register(params)
    redirect_to new_network_path
  end

  # PUT /causes/1
  # PUT /causes/1.json
  def update
    @cause = Cause.find(params[:id])

    respond_to do |format|
      if @cause.update_attributes(params[:cause])
        format.html { redirect_to @cause, notice: 'Cause was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy

    respond_to do |format|
      format.html { redirect_to causes_url }
      format.json { head :no_content }
    end
  end
  
  def affected
    if request.post?
      cause = current_user.cause
      cause.affected_name = params[:affected_name]
      redirect_to cause_network_path(:id => current_user.cause) if cause.save
    end
  end

  def tasks
    @tasks = Cause.find(params[:id]).tasks
  end

  def tasks_list
    @tasks = Cause.find(params[:id]).tasks
    render :layout => false
  end
end
