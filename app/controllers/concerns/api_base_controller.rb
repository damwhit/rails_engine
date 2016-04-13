module ApiBaseController
  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end

  def find
    respond_with model.find_by(strong_params)
  end

  def find_all
    respond_with model.where(strong_params)
  end

  def random
    respond_with model.order("RANDOM()").first
  end

  def strong_params
    params.permit(model_params)
  end
end
