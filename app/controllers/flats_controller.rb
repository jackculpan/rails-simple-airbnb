class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def add
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
    redirect_to flat_path(@flat.id)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end

    redirect_to flat_path(@flat.id)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path
  end

end
