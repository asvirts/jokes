class JokesController < ApplicationController
  before_action :set_joke, only: [:show, :edit, :update, :destroy]

  def index
    @jokes = Joke.all
  end

  def show
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(joke_params)

    if @joke.save
      redirect_to jokes_path, notice: "Joke was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @joke.update(joke_params)
      redirect_to jokes_path, notice: "Joke was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @joke.destroy
    redirect_to jokes_path, notice: "Joke was successfully destroyed."
  end

  private

  def set_joke
    @joke = Joke.find(params[:id])
  end

  def joke_params
    params.require(:joke).permit(:name)
  end
end