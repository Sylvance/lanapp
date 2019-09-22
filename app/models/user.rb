# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :videos, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :playlists, dependent: :destroy

  validates :name, presence: true, format: /\A[0-9a-zA-Z_\-\.]{6,}\z/
  validates :password, presence: true, format: /\A[^ ]{6,}\z/
  validates :email, presence: true, format: /\A[a-zA-Z0-9_\-\.]+@(([a-zA-Z]+\.[a-zA-Z]+)|(([0-9]\.){3}[0-9]))\z/, uniqueness: true

  rolify before_add: :print_role_added
  after_create :assign_default_role

  def print_role_added(role)
    puts 'Adding this role ...'
    puts role
  end

  def assign_default_role
    add_role(:default) if roles.blank?
  end

  def assign_superadmin_role
    add_role :superadmin
  end

  def assign_admin_role
    add_role :admin
  end

  def assign_tutor_role
    add_role :tutor
  end

  def assign_viewer_role(resource)
    add_role :viewer, resource
  end

  def is_superadmin?
    has_role? :superadmin
  end

  def is_admin?
    has_role? :admin
  end

  def is_tutor?
    has_role? :tutor
  end

  def is_able_to_view?(resource)
    has_strict_role :viewer, resource
  end

  def remove_admin_role
    remove_role :admin
  end

  def remove_tutor_role
    remove_role :tutor
  end

  def remove_viewer_role(resource)
    remove_role :viewer, resource
  end
end
