class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table(:users, id: :uuid) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :username
      t.string :slug
      t.string :twitter
      t.string :homepage

      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state_province
      t.string :country
      t.string :postal_code

      # http://www.whitehouse.gov/omb/fedreg_1997standards
      #
      # The goal is to be able to identify whether people
      # of various demographics are being represented in
      # user-group communities.
      #
      # Are parents being represented? POC? Sexual Orientation? Etc.
      #
      # What variety of combinations of people's can be found across the global community?
      t.text :birthday
      t.text :ethnicity
      t.text :gender
      t.text :parental_status
      t.text :race
      t.text :relationship_status
      t.text :religious_affiliation
      t.text :sexual_orientation

      t.boolean :email_opt_in, default: false
      t.boolean :send_stickers
      t.date    :stickers_sent_on

      t.string :interests, array: true

      t.text :bio

      t.float :latitude
      t.float :longitude

      t.boolean :admin, default: false

      t.timestamps
    end

    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :slug, unique: true
    add_index :users, :username, unique: true
    add_index :users, [:latitude, :longitude]
  end
end
