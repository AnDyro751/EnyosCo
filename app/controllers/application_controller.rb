class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def resource
    @resource ||= Member.new
  end

  def resource_class
    :member
  end
end
