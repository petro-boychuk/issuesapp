class IssuesController < ApplicationController


  before_filter :authenticate_staff!, :except => [:index, :show, :new]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    @client = @issue.client
  end

  # POST /issues
  # POST /issues.json
  def create

    @client = Client.new(params[:client])

    if !@client.valid?
      render action: "new"
      return
    end

    params[:issue][:client] = @client
    params[:issue][:status] = Status.initial_status

    @issue = Issue.new(params[:issue])

    if @issue.save
      redirect_to @issue, notice: 'Issue was successfully created.'
    else
      render action: "new"
    end


  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])

    @client = @issue.client

    valid_client = @client.update_attributes(params[:client])
    valid_issue = @issue.update_attributes(params[:issue])

    if  valid_client && valid_issue
      redirect_to @issue, notice: 'Issue was successfully updated.'
    else
      render :action => :edit

    end

  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end
end
