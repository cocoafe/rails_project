class AliensController < ApplicationController
  before_action :set_alien, only: [:show, :edit, :update, :destroy]

  # GET /aliens
  # GET /aliens.json
  def index
    @aliens = Alien.all.page(params[:page]).per(100)
  end

  # GET /aliens/1
  # GET /aliens/1.json
  def show
    @alien = Alien.find(params[:id])
    @logs = @alien.logs.page(params[:page]).per(50)
  end

  # GET /aliens/new
  def new
    @category = Category.find(params[:id])
    @alien = @category.alien.build
  end

  # GET /aliens/1/edit
  def edit
  end

  # POST /aliens
  # POST /aliens.json
  def create
    @category = Category.find(params[:id])
    @alien = @category.alien.build(alien_params)
  
    respond_to do |format|
      if @alien.save
        format.html { redirect_to category_path(:id => @category.id) , notice: 'Alien was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alien }
      else
        format.html { render action: 'new' }
        format.json { render json: @alien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aliens/1
  # PATCH/PUT /aliens/1.json
  def update
    respond_to do |format|
      if @alien.update(alien_params)
        format.html { redirect_to @alien, notice: 'Alien was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aliens/1
  # DELETE /aliens/1.json
  def destroy
    @alien.destroy
    respond_to do |format|
      format.html { redirect_to aliens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alien
      @alien = Alien.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alien_params
      params.require(:alien).permit(:alien_name, :category_id)
    end
   
    
end
