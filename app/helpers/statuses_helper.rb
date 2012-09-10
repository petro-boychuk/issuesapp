module StatusesHelper

  def status_color(status)

    return "-" if status.nil?

    colors = {
        :waiting_staff => "important",
        :waiting_customer => "info",
        :on_hold => "warning",
        :cancelled => "inverse",
        :completed => "success"
    }

    content_tag :span, status.title, :class => "label label-#{colors[status.kind.to_sym]}"

    #status.title
  end

end
