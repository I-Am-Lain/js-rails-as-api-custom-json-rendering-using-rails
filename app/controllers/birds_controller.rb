class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds

    ####include what keys we want, specified in any order (order is displayed)
    #render json: birds, only: [:id, :name, :species]

    #exclude specific keys
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])    #FIND_BY SPECIFICALLY, RATHER THAN FIND
    #render json: {id: bird.id, name: bird.name, species: bird.species } 
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
  end
end