module ApplicationHelper

  def action_contact
    if current_user
      "showContactModal"
    else
      "redirectLogin"
    end
  end

end
