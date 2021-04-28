class ServicesController < ApplicationController
  skip_before_action :authenticate_request

  # GET /services
  def index
    @services = Service.all

    if @services
      render json: { data: @services }, status: :ok
    else
      render json: { error: 'Sorry ! No Services.' }, status: :not_found
    end
  end

  # GET /services/1
  def show
    render json: @service
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.require(:service).permit(:service_name, :description)
    end
end
