# frozen_string_literal: true
class UserGroupMembership < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  default_scope { order('created_at ASC') }

  enum relationship: %i(member organizer founder)

  # TODO: Move the membership to the Profile.
  belongs_to :user
  belongs_to :user_group

  validates :user, presence: true
  validates :user_group, presence: true
end

# == Schema Information
#
# Table name: user_group_memberships
#
#  id            :uuid             not null, primary key
#  user_id       :uuid
#  user_group_id :uuid
#  relationship  :integer          default(0)
#  created_at    :datetime
#  updated_at    :datetime
#
