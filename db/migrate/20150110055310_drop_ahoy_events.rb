# frozen_string_literal: true
class DropAhoyEvents < ActiveRecord::Migration
  def change
    drop_table :ahoy_events
  end
end
