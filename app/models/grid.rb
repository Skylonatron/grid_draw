class Grid < ApplicationRecord

  validates_presence_of :name, :width, :height

  serialize :squares

  # belongs_to :user

  before_create :create_squares

  def create_squares

    column = Array.new(height, "FFFFFF")

    squares_array = Array.new(width, column)

    self.squares = squares_array

  end

end
