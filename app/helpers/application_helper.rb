module ApplicationHelper
  def accounts_controller?
    controller_name == "accounts"
  end
end
