class SquaresController < ApplicationController

  def update

    grid = Grid.first
    x = params[:x]
    y = params[:y]
    color = params[:color]

    if square = grid.squares.find_by(x: x, y: y)
      # ActionCable.server.broadcast('squares', x: x, y: y, color: color)

      square.update(color: color)
      render status: 200, json: { status: 'ok' }.to_json
    else
      render status: 200, json: { status: 'miss' }.to_json
    end

  end

end
