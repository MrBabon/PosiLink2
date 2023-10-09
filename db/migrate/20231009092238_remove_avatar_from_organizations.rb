class RemoveAvatarFromOrganizations < ActiveRecord::Migration[7.0]
  def change
    remove_column :organizations, :avatar, :string
  end
end
