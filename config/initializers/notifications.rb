ActiveSupport::Notifications.subscribe "sql.find_current_user" do |name, start, finish, id, payload|
  @user_id=payload[:userid]
end

ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
  PageRequest.create! do |page_request|
    if @user_id
      page_request.user_id = @user_id
      page_request.path = payload[:path]
    end
  end
end






