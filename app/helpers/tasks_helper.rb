module TasksHelper

  def status_collection
    Task.statuses.keys.map {|key| [I18n.t("activerecord.attributes.task/statuses.#{key}"), key]}
  end

  def status_label_class(task_status)
    case task_status
    when 'pending'  then 'label-warning'
    when 'ongoing'  then 'label-primary'
    when 'finished' then 'label-success'
    end
  end

end