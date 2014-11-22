class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  def search
    puts "++++++++++++++++++++++++++++++++++++++++++++"
    puts "MADE IT"
    puts "++++++++++++++++++++++++++++++++++++++++++++"
    puts params
    puts "++++++++++++++++++++++++++++++++++++++++++++"
  end

  # GET /breweries
  # GET /breweries.json
  def index
    #@breweries = Brewery.all
    @breweries = Brewery.all.order("name ASC")
    @results = Brewery.joins(:beers).group("breweries.name").select("breweries.name as brewery_name, count(beers.id) as beer_count")
    puts "++++++++++++++++++++++++++++++++++++++++++++"
    puts @results
    puts "++++++++++++++++++++++++++++++++++++++++++++"
  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
    puts "Called show.."
  end

  # GET /breweries/new
  def new
    @brewery = Brewery.new
  end

  # GET /breweries/1/edit
  def edit
    @brands = Brand.all
  end

  # POST /breweries
  # POST /breweries.json
  def create
    @brewery = Brewery.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to @brewery, notice: 'Brewery was successfully created.' }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breweries/1
  # PATCH/PUT /breweries/1.json
  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to @brewery, notice: 'Brewery was successfully updated.' }
        format.json { render :show, status: :ok, location: @brewery }
      else
        format.html { render :edit }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breweries/1
  # DELETE /breweries/1.json
  def destroy
    @brewery.destroy
    respond_to do |format|
      format.html { redirect_to breweries_url, notice: 'Brewery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      @brewery = Brewery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:name, :latitude, :longitude, :address, :homepage)
    end
end
