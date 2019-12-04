## celebrities_controller.rb

module Api
    class CelebritiesController < ApplicationController
        def index
            celebrities = Celebrity.all
            render json: { status: "SUCCESS", message:'View all of your loaded celebrities below.', data: celebrities }, status: :ok
        end

        def show
            celebrity = Celebrity.find(params[:id])
            render json: { status: "SUCCESS", message:'See the information on your loaded celebrity below.', data: celebrity }, status: :ok
        end

        # will create new object in DB if POST request sent to api/celebrities
        def create
            celebrity = Celebrity.new(celebrity_params)
            if celebrity.save
                render json: { status: 'SUCCESS', message:'You created a new celebrity in the database. See below.', data: celebrity }, status: :ok
            else
                render json: { status: 'ERROR', message:'You were unable to save a new celebrity. Please try again.', data: celebrity.errors }, status: :unprocessable_entity
            end
        end

        # will delete an existing object in DB if DELETE request sent to api/celebrities
        def destroy
            celebrity = Celebrity.find(params[:id])
            celebrity.destroy
            render json: { status: 'SUCCESS', message:'You deleted a celebrity record.', data: celebrity }, status: :ok
        end

        # will update an existing object in DB if PATCH/PUT request sent to api/celebrities/:id
        def update
            celebrity = Celebrity.find(params[:id])
            if celebrity.update_attributes(celebrity_params)
                render json: { status: 'SUCCESS', message:'You updated the celebrity record in the database.', data: celebrity }, status: :ok
            else
                render json: { status: 'ERROR', message:'You were unable to update the celebrity record. Please try again.', data: celebrity.errors }, status: :unprocessable_entity
            end
        end

        private

        def celebrity_params
            params.require(:celebrity).permit(:name, :wiki_page)
        end
    end
end