# frozen_string_literal: true
RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  unless Rails.env.development?
    config.authenticate_with do
      warden.authenticate! scope: :user
    end
    config.current_user_method(&:current_user)
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

# module RailsAdmin
# module Config
# module Fields
# module Types
# class Uuid < RailsAdmin::Config::Fields::Base
# RailsAdmin::Config::Fields::Types.register(self)
# end
# end
# end
# end
# end
