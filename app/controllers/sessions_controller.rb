class SessionsController < ApplicationController

#FILTERS
before_filter :require_no_user, :only=>[:first_user,:first_user_create,:new,:create]

# GET /sessions/first_user
# GET /sessions/first_user.xml
def first_user
  user = User.find(:first)
  redirect_to login_path unless user.nil?
end

# POST /sessions/first_user_create
# POST /sessions/first_user_create.xml
def first_user_create
#Create the First User
   role=Role.find_by_role_type("Administrator")
   user = User.find_by_role_id(role.id)
   if user.nil?
     @user = User.new(params[:user])
     @user.login = @user.email if params[:is_login_type_email]
     @user.role = role
     @user.is_activated = true
     if @user.save
      # Save all
      # Login / Email Authentication Setting
       setting = Setting.find_by_name("is_login_type_email")
       setting.setting_value = (params[:is_login_type_email].nil? ? "false" : "true")
       setting.save
      # User registration Setting
       setting = Setting.find_by_name("allow_user_register_user")
       setting.setting_value = (params[:allow_user_register_user].nil? ? "false" : "true")
       setting.save
      # Welcome email setting
       setting = Setting.find_by_name("send_welcome_email")
       setting.setting_value = (params[:send_welcome_email].nil? ? "false" : "true")
       setting.save
      # Administrator registration setting
       setting = Setting.find_by_name("allow_admin_register_user")
       setting.setting_value = (params[:allow_admin_register_user].nil? ? "false" : "true")
       setting.save
      # User activation setting
       setting = Setting.find_by_name("user_activation_required_on_user")
       setting.setting_value = (params[:user_activation_required_on_user].nil? ? "false" : "true")
       setting.save
      # Administrator activation setting
       setting = Setting.find_by_name("user_activation_required_on_admin")
       setting.setting_value = (params[:user_activation_required_on_admin].nil? ? "false" : "true")
       setting.save
      # URL Setting
       setting = Setting.find_by_name("site_url")
       setting.setting_value = params[:site_url]
       setting.save
      # Smtp Setting
       setting = Setting.find_by_name("smtp_settings")
       setting.setting_value = params[:smtp_settings]
       setting.save
      #View users account information setting
       setting = Setting.find_by_name("allow_view_user_account")
       setting.setting_value = params[:allow_view_user_account]
       setting.save
       respond_to do |format|
         flash[:notice] = "Administrator was successfully created."
         format.html { redirect_to(login_path) }
         format.xml  { head:ok }
       end
     else
       respond_to do |format|
        flash[:notice] = "Error in creation of the first user"
        format.html { render :action=>"first_user" }
        format.xml  { render :xml=>@user.errors,:status=>:unprocessable_entity }
       end
     end
   else
    respond_to do |format|
         flash[:notice] = "Administrator is already available"
         format.html { redirect_to(login_path) }
         format.xml  { head:ok }
       end
   end
   
end

# GET /sessions/new
# GET /sessions/new.xml
def new
  @user = User.find(:first)
  if @user.nil?
   respond_to do |format|
     format.html { redirect_to first_user_sessions_path}
     format.xml  { head:ok }
   end
  else
   respond_to do |format|
      format.html #new.html.erb
      format.xml  { render :xml => @user }
   end
  end
end
 

# POST /sessions
# POST /sessions.xml
def create
  if current_user.nil?
     @user = User.find_by_login(params[:login])
     user =User.authenticate(params[:login], params[:password])
     respond_to do |format|
      if @user.nil? 
          flash[:notice]="Incorrect Login"
          format.html {render :action => :new}
      elsif !@user.is_activated
	  flash[:notice]="User not yet activated. Please check your activation email."
          format.html {render :action => :new}
      elsif user.nil?
          @user.failed_login_count += 1
          @user.save
         flash[:notice]="Login correct Incorrect password"
         format.html{ render :action => :new }
      else
         flash[:notice] = "Login successful!"
         self.current_user = @user
         if params[:remember_me]=="1"
           cookies[:remember_me_code] = {:value => current_user.salt, :expires => 30.days.from_now }
         end
         @user.last_login_ip=@user.current_login_ip
         @user.current_login_ip=request.remote_ip
         @user.login_count+=1 
	 @user.save
         if current_user.admin?
            format.html{ redirect_to admin_path }
         else
            format.html{ redirect_to account_path }
         end
      end
      format.xml  { render :xml => @user }
    end
 end
end

# DELETE /sessions/1
# DELETE /sessions/1.xml
def destroy
    cookies.delete :remember_me_code
    session[:user]=nil
    flash[:notice] = "You have been logged out successfully."
    respond_to do |format|
       format.html{ redirect_to login_path }
       format.xml  { render :xml => @user }
    end
end

end
