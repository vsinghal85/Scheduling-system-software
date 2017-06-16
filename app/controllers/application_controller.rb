class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :client
      new_client_session_path
    elsif resource_or_scope == :teacher
      new_teacher_session_path
    else
      root_path
    end
  end

end
