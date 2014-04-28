class CirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :destroy]


  def index
    @circles = Circle.all
  end


  def show
    #@circle = Circle.find(params[:id])
  end

  def new
    @circle = Circle.new
  end

  def edit
    #@circle = Circle.find(params[:id])
  end

  def create
    @circle = Circle.new(circle_params)
    user_ids.each { |uid| @circle.user_ids << uid }
    fail
    respond_to do |format|
      if @circle.save
        format.html { redirect_to @circle, notice: 'Circle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @circle }
      else
        format.html { render action: 'new' }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circles/1
  # PATCH/PUT /circles/1.json
  def update
    respond_to do |format|
      if @circle.update(circle_params)
        format.html { redirect_to @circle, notice: 'Circle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle.destroy
    respond_to do |format|
      format.html { redirect_to circles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_params
      params.require(:circle).permit(:title)
    end

    def user_ids
      params.require(:users).require(:user_ids)
    end
end
