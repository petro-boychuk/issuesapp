class HistoriesController < ApplicationController
  # POST /histories.json
  def create
    @history = History.new(params[:history])

    @issue = Issue.find params[:issue][:id]
    @new_owner = Staff.find_by_id params[:staff][:id]
    @new_status = Status.find params[:status][:id]

    if @history.valid?
      @history.apply_to! @issue, @new_status, @new_owner, current_staff
      redirect_to @issue
    else
      redirect_to @issue, :alert => @history.errors.full_messages.join("\n")
    end
  end
end
