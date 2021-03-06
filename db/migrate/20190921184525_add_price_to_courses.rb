# frozen_string_literal: true

class AddPriceToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :price, :decimal, precision: 5, scale: 2
  end
end
