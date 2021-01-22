class ItemsController < ApplicationController
  #ログインしてない人はログインページへ
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  #ログインしているユーザーが出品者でない場合、以下にアクセスする時はトップページへ
  before_action :move_to_root_path, only: [:edit, :update, :destroy] 

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

  def show
    # before_action :find_item で設定済み @item = Item.find(params[:id])
  end

  def edit
    # find_item参照
  end

  def update
     # find_item参照
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :text, :price, :category_id, :state_id, :delivery_fee_id,
                                 :delivery_prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path  
    if current_user.id != @item.user.id
      redirect_to  root_path
    end
  end

end
