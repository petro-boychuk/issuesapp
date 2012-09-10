class IssueMailer < ActionMailer::Base
  default :from => "issueapp@example.com"


  def received_request(issue)

    @issue = issue
    @client = issue.client

    mail(:to => @client.email, :subject => "Your request at Issuesapp has been submitted")
  end


  def new_reply(history)
    @history = history
    @issue = @history.issue
    @client = @issue.client


    mail(:to => @client.email, :subject => "Updates for your request")
  end

end
