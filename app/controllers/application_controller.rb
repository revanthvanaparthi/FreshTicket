class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_agent!, except: [ :show , :index, :premium_orgs, :tickets_status, :tickets_org, :unassign_tickets]


    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:role_id,:report_to,:reporter])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,:role_id,:report_to,:reporter])
    end
end
