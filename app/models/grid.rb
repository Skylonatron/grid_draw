class Grid < ApplicationRecord

  validates_presence_of :name, :width, :height

  serialize :squares, Hash

  belongs_to :user, required: false

  before_create :create_squares

  enum tunnel_status: { tunnel_off: 0, tunnel_on: 1 }

  def create_squares 

    (0...width).each do |i|
      self.squares[i] = Array.new(height, "FFFFFF")
    end

  end

  def clear

    create_squares
    save!

  end

end
