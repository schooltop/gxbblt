class IndustryesController < ApplicationController
  before_action :set_industrye, only: [:show, :edit, :update, :destroy]

  # GET /industryes
  # GET /industryes.json
  def index
    @industryes = Industrye.all
  end

  # GET /industryes/1
  # GET /industryes/1.json
  def show
    @industryes = Industrye.find(industrye_params)
  end

  # GET /industryes/new
  def new
    @industrye = Industrye.new
  end

  # GET /industryes/1/edit
  def edit
  end

  # POST /industryes
  # POST /industryes.json
  def create
    @industrye = Industrye.new(industrye_params)

    respond_to do |format|
      if @industrye.save
        format.html { redirect_to @industrye, notice: 'Industrye was successfully created.' }
        format.json { render :show, status: :created, location: @industrye }
      else
        format.html { render :new }
        format.json { render json: @industrye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industryes/1
  # PATCH/PUT /industryes/1.json
  def update
    respond_to do |format|
      if @industrye.update(industrye_params)
        format.html { redirect_to @industrye, notice: 'Industrye was successfully updated.' }
        format.json { render :show, status: :ok, location: @industrye }
      else
        format.html { render :edit }
        format.json { render json: @industrye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industryes/1
  # DELETE /industryes/1.json
  def destroy
    @industrye.destroy
    respond_to do |format|
      format.html { redirect_to industryes_url, notice: 'Industrye was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrye
      @industrye = Industrye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrye_params
      params.fetch(:industrye, {})
    end
end
