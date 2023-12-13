class AddIndexToUsersResetPasswordToken < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_index :users, :reset_password_token, :unique => true, :algorithm => :concurrently
  end
end
