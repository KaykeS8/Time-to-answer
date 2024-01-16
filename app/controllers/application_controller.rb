class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :set_global_params

  protected

  def layout_by_resource
    return "#{resource_class.to_s.downcase}_devise" if devise_controller?
    "aplication"
  end


  def set_global_params
    $global_params = params
  end
end
