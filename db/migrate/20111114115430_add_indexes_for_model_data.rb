class AddIndexesForModelData < ActiveRecord::Migration
  def self.up
    add_index :model_data,:model_component_id
    add_index :model_data,:model_submission_id
    add_index :model_data,:creator_id
    add_index :model_data,:updater_id
    add_index :object_models,:categoryset_id
    add_index :view_orders,:view_id
    add_index :permission_roles,:permission_id
    add_index :permission_roles,:role_id
    add_index :comment_components,:object_model_id
    add_index :form_submissions,:object_form_id
    add_index :comment_data,:comment_component_id
    add_index :comment_data,:comment_submission_id
    add_index :user_details,:user_id
    add_index :user_details,:user_detail_setting_id
    add_index :model_components,:object_model_id
    add_index :form_data,:form_component_id
    add_index :form_data,:form_submission_id
    add_index :pages,:creator_id
    add_index :pages,:updater_id
    add_index :model_submissions,:object_model_id
    add_index :model_submissions,:creator_id
    add_index :model_submissions,:updater_id
    add_index :mailers,:object_form_id
    add_index :mailers,:object_model_id
    add_index :form_components,:object_form_id
    add_index :view_conditions,:view_id
    add_index :view_components,:view_id
    add_index :menus,:parent_id
    add_index :menus,:menuset_id
    add_index :menus,:page_id
    add_index :users,:role_id
    add_index :categories,:categoryset_id
    add_index :categories,:parent_id
    add_index :page_variables,:page_id
    add_index :page_variables,:page_variable_setting_id
    add_index :comment_submissions,:model_submission_id
    add_index :comment_submissions,:parent_id
    add_index :comment_submissions,:creator_id
    add_index :comment_submissions,:updater_id
    add_index :categorizations,:model_submission_id
    add_index :categorizations,:category_id
  end

  def self.down
    remove_index :model_data,:model_component_id
    remove_index :model_data,:model_submission_id
    remove_index :model_data,:creator_id
    remove_index :model_data,:updater_id
    remove_index :object_models,:categoryset_id
    remove_index :view_orders,:view_id
    remove_index :permission_roles,:permission_id
    remove_index :permission_roles,:role_id
    remove_index :comment_components,:object_model_id
    remove_index :form_submissions,:object_form_id
    remove_index :comment_data,:comment_component_id
    remove_index :comment_data,:comment_submission_id
    remove_index :user_details,:user_id
    remove_index :user_details,:user_detail_setting_id
    remove_index :model_components,:object_model_id
    remove_index :form_data,:form_component_id
    remove_index :form_data,:form_submission_id
    remove_index :pages,:creator_id
    remove_index :pages,:updater_id
    remove_index :model_submissions,:object_model_id
    remove_index :model_submissions,:creator_id
    remove_index :model_submissions,:updater_id
    remove_index :mailers,:object_form_id
    remove_index :mailers,:object_model_id
    remove_index :form_components,:object_form_id
    remove_index :view_conditions,:view_id
    remove_index :view_components,:view_id
    remove_index :menus,:parent_id
    remove_index :menus,:menuset_id
    remove_index :menus,:page_id
    remove_index :users,:role_id
    remove_index :categories,:categoryset_id
    remove_index :categories,:parent_id
    remove_index :page_variables,:page_id
    remove_index :page_variables,:page_variable_setting_id
    remove_index :comment_submissions,:model_submission_id
    remove_index :comment_submissions,:parent_id
    remove_index :comment_submissions,:creator_id
    remove_index :comment_submissions,:updater_id
    remove_index :categorizations,:model_submission_id
    remove_index :categorizations,:category_id
  end
end
