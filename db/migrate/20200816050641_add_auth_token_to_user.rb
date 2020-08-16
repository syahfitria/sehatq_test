class AddAuthTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :auth_token, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
