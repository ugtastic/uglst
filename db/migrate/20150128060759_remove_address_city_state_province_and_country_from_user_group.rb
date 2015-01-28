class RemoveAddressCityStateProvinceAndCountryFromUserGroup < ActiveRecord::Migration
  def change
    remove_column :user_groups, :address
    remove_column :user_groups, :formatted_address
    remove_column :user_groups, :city
    remove_column :user_groups, :state_province
    remove_column :user_groups, :country
  end
end
