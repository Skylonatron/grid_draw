class Grid < ApplicationRecord

  validates_presence_of :name, :width, :height

  has_many :squares, dependent: :destroy

  after_create :create_squares

  def create_squares
    (0...width).each do |x|
      (0...height).each do |y|
        self.squares.create(color: 'white', x: x, y: y)
      end
    end
  end
end