class Page < ActiveRecord::Base
include PermalinkHelper


#Associations
has_one :menu ,:dependent => :destroy
has_many :page_variables ,:dependent => :destroy
regex_pattern = /\/(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#validations
validates :title ,:presence=>true
validates :perma_link ,:presence=>true, :uniqueness=>true ,:format=>{:with=>regex_pattern ,:message=>"Should contain a / and alphabets /alpabets and numbers/ and may have - separator "}
validates :email, :format=> {:with => email_regex } ,:allow_blank =>true

#named scope
scope :pages ,  :conditions =>"type is null"
scope :object_forms,  :conditions =>"type = 'ObjectForm'"
scope :views,  :conditions => "type = 'View'"

#callbacks
after_save :set_menu ,:clear_cache
after_update :clear_cache
after_destroy :clear_cache

#instance methods

def menu_menuset_id
 unless self.menu.nil?
   return self.menu.menuset_id
 end
end

def menu_menuset_id=(value)
 @menuset_id = value
end

def menu_parent_id
 menu = Menu.find_by_page_id(self.id)
 unless menu.nil?
   return menu.parent_id
 end
end

def menu_parent_id=(value)
 @parent_id=value
end

def permalnk
return self.perma_link
end

def permalnk=(value)
 @permalnk = value
end


def menu_name
  unless self.id.nil?
  menu = Menu.find_by_page_id(self.id)
  unless menu.nil?
   return menu.name
 end
end
end

def menu_name=(value)
 @menu_name=value
end



def generate_perma_link(perma_link)
    page = Page.find_by_perma_link("/"+perma_link)
    if page.nil?
      return perma_link
    else
      count = 0
      until (Page.find_by_perma_link("/"+perma_link + "-" + count.to_s).nil?)
        count+=1
      end
      return perma_link + "-" + count.to_s
    end
  end

 def perma_link_generate
     self.perma_link = "/" + generate_perma_link(create_permalink(self.title))
 end



#private methods
private

 def set_menu
   unless @menu_name.nil?
      unless @menu_name.empty?
      menu = self.menu
      if menu.nil?
	    menu = Menu.new
      end 
      menu.name = @menu_name
      menu.parent_id = @parent_id
      menu.page_id = self.id
      menu.menu_view_type = self.page_view_type
      if @parent_id.to_i < 0
        menu.menuset_id = @parent_id.to_i.abs
      else
        menu.menuset_id= Menu.find(@parent_id).menuset_id
      end
      menu.save
    end
  end
 end



def destroy_menu
 unless self.menu.nil?
   self.menu.destroy
 end 
end

def clear_cache
  root_path = Rails.root.to_s + "/tmp/cache"
  entries = Dir.entries(root_path)
  entries.each do |entry|
   unless (entry == "." || entry == "..")
       FileUtils.rm_rf(root_path + "/"+ entry)
   end
end
end
end



# == Schema Information
#
# Table name: pages
#
#  id             :integer(4)      not null, primary key
#  title          :string(255)
#  body           :text
#  perma_link     :string(255)
#  home_page      :boolean(1)      default(FALSE)
#  page_view_type :integer(4)      default(0)
#  user_id        :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

