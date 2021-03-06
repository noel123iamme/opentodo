class Api::ItemsController < ApiController
  before_action :authenticated?
  
  def index
    items = Item.where(list_id: params[:list_id])
    render json: items
  end

  def create
  	item = Item.new(item_params)
    item.list = List.find(params[:list_id])
    if item.save!
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
    render :json => {}, :status => :not_found
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
  end

  private

  def item_params
  	params.require(:item).permit(:name, :body)
  end
end