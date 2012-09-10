class IssuesController < ApplicationController

  before_filter :authenticate_staff!, :except => [:show, :new, :create]

  # GET /issues
  def index

    @filter = params[:filter]
    @filter = @filter.to_sym if @filter

    if Issue.filters.include?(@filter)
      @issues = Issue.send(@filter)
    else
      @filter = :all
      @issues = Issue.all
    end



    if params[:search]
      @search_term = params[:search][:search]
      #TODO Try to find issue this this id, else try to find issue with this text

      if issue = Issue.reference_search(@search_term)
        redirect_to issue
      else
        @issues = Issue.term_search @search_term

        @filter = :none
      end
    end

  end

  # GET /issues/1
  def show
    @issue = Issue.find(params[:id])

  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @client = Client.new
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    @client = @issue.client
  end

  # POST /issues
  def create

    @client = Client.new(params[:client])
    @issue = Issue.new(params[:issue])

    valid_client = @client.valid?

    @issue.client = @client
    @issue.status = Status.initial_status

    valid_issue = @issue.valid?

    if valid_issue && valid_issue && @issue.save && @client.save

      IssueMailer.received_request(@issue).deliver
      redirect_to @issue, notice: 'Issue was successfully created.'
    else
      render action: "new"
    end


  end

  # PUT /issues/1
  def update
    @issue = Issue.find(params[:id])

    @client = @issue.client

    valid_client = @client.update_attributes(params[:client])
    valid_issue = @issue.update_attributes(params[:issue])

    if  valid_client && valid_issue
      redirect_to @issue, :hash => @issue.access_hash, notice: 'Issue was successfully updated.'
    else
      render :action => :edit

    end

  end

  # DELETE /issues/1
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    redirect_to issues_url
  end
end
