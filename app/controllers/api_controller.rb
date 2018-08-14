class ApiController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_user!


  def connect_user_to_grid

    unless current_user
      render json: { status: "No User" } and return
    end


    if grid = Grid.find_by(device_key: params[:key].to_i)
      grid.update(user: current_user)
    else 
      render json: { status: "No Grid "} and return
    end

    render json: { status: "OK" }.to_json and return
  end

  def user_grids

    unless current_user
      render json: { status: "No User" } and return
    end

    grids = current_user.grids

    grids_hash = grids.each_with_index.map do |grid, i|
      {
        key:              i,
        id:               grid.id,
        name:             grid.name,
        width:            grid.width,
        height:           grid.height
      }
    end

    render json: grids_hash.to_json

  end

  def update_grid

    unless grid = current_user.grids.find_by(id: params[:grid_id])
      render json: { status: "No Grid "} and return
    end

    # Update the Grid in Node 

    grid_info = "#{params[:x]},#{params[:y]},#{params[:color]}"

    live_pre = "173.255.221.187:3333"
    test_pre = "192.168.0.5:3333"

    uri = URI.parse("http://#{live_pre}/#{grid.id}/#{grid_info}")

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)

    # Send the request
    http.request(request)

    # Update the Grid in Rails

    grid.squares[params[:x].to_i][params[:y].to_i] = params[:color]
    grid.save!



    render json: { status: "OK" }

  end

end








