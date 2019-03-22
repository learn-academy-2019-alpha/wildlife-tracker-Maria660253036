class AnimalsController < ApplicationController
    def new
        @animal = Animal.new
    end 
    
    def index
        @animal = Animal.all
    end 
    
    def create
        @animal = Animal.new(animal_params)
        if @animal.valid?
            @animal.save
            redirect_to '/animals'
        else
            @errors = @animal.errors.full_messages
            render 'new'
        end
    end 
    
    def edit
        @animal = Animal.find(params[:id])
    end
    
    def update
        @animal = Animal.find(params[:id])
        if @animal.update_attributes(animal_params)
            redirect_to '/animals'
        else
            render 'new'
        end
    end
    
    def show
        @animal = Animal.find(params[:id])
    end
    
    def destroy
        @animal = Animal.destroy(params[:id])
        @animal.delete
        redirect_to '/animals'
    end 
    
    private 
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end
    
end
