class Admin::AdminController < ApplicationController

#Filters
before_filter :require_admin

# MATCH admin/dashboard
def dashboard
 
   @objects=ObjectModel.all
   respond_to do |format|
      format.html #dashboard.html.erb
      format.xml  { head :ok }
    end 
end

# MATCH admin/clear_cache
def clear_cache
  root_path = Rails.root.to_s + "/tmp/cache"
  entries = Dir.entries(root_path)
  entries.each do |entry|
   unless (entry == "." || entry == "..")
       FileUtils.rm_rf(root_path + "/"+ entry)
   end
  end
  flash[:notice] = t(:cache_empty)
  respond_to do |format|
      format.html { redirect_to(:action=>'dashboard',:controller=>'admin') }
      format.xml  { head :ok }
    end 
  end
end
