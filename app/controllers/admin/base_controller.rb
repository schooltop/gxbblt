class Admin::BaseController < ActionController::Base
    protect_from_forgery with: :exception
    layout "admin"
    respond_to :html
    before_action :authenticate_employee!
    #before_action :check_permission, :except => [:desboart]

    def check_permission
       unless current_employee.roles.map{|role| role.permissions}.flatten.uniq.select{|per| per.controller_tag == "#{controller_name}"}.size > 0
         flash[:notice] = "你没有权限"
         redirect_to "/admin/employees/desboart"
       end
       # unless current_employee.roles.map{|role| role.permissions}.flatten.uniq.select{|per| per.controller_tag == "#{controller_name}" && per.action_tag == "#{action_name}"}.size > 0
       #   flash[:notice] = "你没有权限"
       #   redirect_to "/admin/employees/desboart"
       # end
    end
end
