# frozen_string_literal: true
class UserGroup < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: proc { |c, _| c && c.current_user ? c.current_user : nil }

  has_paper_trail

  include PgSearch
  pg_search_scope :search_for,
                  against: %i(name description),
                  using: %i(tsearch trigram)

  extend FriendlyId
  friendly_id :slug_candidates, use: %i(slugged)

  mount_uploader :logo, UserGroupLogoUploader

  acts_as_taggable_on :topics

  default_scope { order('created_at ASC') }

  belongs_to :registered_by, class_name: 'User', foreign_key: 'registered_by_id'

  has_many :network_affiliations
  has_many :networks, through: :network_affiliations

  has_many :user_group_memberships
  has_many :users, through: :user_group_memberships

  validates :name, presence: true, length: { minimum: 2, maximum: 64 }, allow_blank: false, uniqueness: true
  validates :description, presence: nil, length: { minimum: 8, maximum: 2048 }, allow_blank: false
  validates :shortname, presence: nil, length: { minimum: 1, maximum: 15 }, allow_blank: true, uniqueness: true

  has_one :user_group_twitter_account
  has_one :twitter_account, through: :user_group_twitter_account

  def user_group_twitter_account
    super || build_user_group_twitter_account
  end

  has_one :user_group_location
  has_one :location, through: :user_group_location

  def user_group_location
    super || build_user_group_location
  end

  def slug_candidates
    shortname.present? ? [:shortname] : [:name]
  end
end

# == Schema Information
#
# Table name: user_groups
#
#  id               :uuid             not null, primary key
#  registered_by_id :uuid
#  homepage         :string
#  name             :string
#  slug             :string
#  description      :text
#  logo             :string
#  created_at       :datetime
#  updated_at       :datetime
#  shortname        :string
#  meetup           :string
#  github           :string
#  facebook         :string
#
