class SquaresChannel < ApplicationCable::Channel  

  def subscribed
    stream_from 'squares'
  end
end