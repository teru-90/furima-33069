class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # 記事一覧を新規投稿順に並べる
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :text, :price, :category_id, :state_id, :delivery_fee_id,
                                 :delivery_prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
