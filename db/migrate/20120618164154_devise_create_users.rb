class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.encryptable
      t.confirmable
      t.lockable    :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable

      # Additional attributes for User model.
      # t.string      :full_name - Will merge all last_name, first_name middle_name
      t.string      :first_name
      t.string      :middle_name
      t.string      :last_name
      t.string      :address
      t.string      :home_number
      t.string      :mobile_number
      t.string      :pin_number
      t.string      :gender,              :default => "Undisclosed"
      t.string      :state,               :null => :no, :default => 'Passive'
      t.string      :type,                :null => :no, :default => 'Client'
      t.datetime    :dob

      # Avatar
      t.string      :avatar_file_name
      t.string      :avatar_content_type
      t.integer     :avatar_file_size
      t.datetime    :avatar_updated_at

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end
end