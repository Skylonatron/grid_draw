class GridsController < ApplicationController
  before_action :set_grid, only: [:show, :edit, :update, :destroy]

  # GET /grids
  # GET /grids.json
  def index
    @grids = Grid.all
  end

  def user_index
    @grids = current_user.grids
  end

  # GET /grids/1
  # GET /grids/1.json
  def show
    @squares = @grid.squares
  end

  # GET /grids/new
  def new
    @grid = Grid.new
  end

  # GET /grids/1/edit
  def edit
  end

  # POST /grids
  # POST /grids.json
  def create

    key = rand(10000)

    @grid = Grid.create(
      device_key: key,
      name: params[:mac], 
      width: params[:width],
      height: params[:height]
    )

    render json: { id: @grid.id, key: key }.to_json


  end

  # PATCH/PUT /grids/1
  # PATCH/PUT /grids/1.json
  def update
    @grid.squares[params[:x]][params[:y]] = params[:color]

    render json: { status: "OK" }
  end

  # DELETE /grids/1
  # DELETE /grids/1.json
  def destroy
    @grid.destroy
    respond_to do |format|
      format.html { redirect_to grids_url, notice: 'Grid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grid
      @grid = Grid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grid_params
      params.fetch(:grid).permit(:name, :width, :height)
    end
end
