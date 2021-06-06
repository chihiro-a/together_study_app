class RecommendsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @recommend = Recommend.new
  end

  def create
    @recommend = Recommend.new(recommend_params)
    @recommend.user_id = current_user.id
    if @recommend.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to recommend_path(@recommend.id)
    else
      render :new
    end
  end

  def show
    @recommend = Recommend.find(params[:id])
    @recommend_comment = RecommendComment.new
  end

  def index
    @recommends = Recommend.all.order(id: "DESC")
  end

  def edit
    @recommend = Recommend.find(params[:id])
    if @recommend.user != current_user
      redirect_to recommends_path
    end
  end

  def update
    @recommend = Recommend.find(params[:id])
    if @recommend.update(recommend_params)
      flash[:notice] = "投稿内容を変更しました。"
      redirect_to recommend_path(@recommend.id)
    else
      render :edit
    end
  end

  def destroy
    @recommend = Recommend.find(params[:id])
    @recommend.delete
    flash[:notice] = "投稿を削除しました。"
    redirect_to recommends_path
  end

  def search
    if params[:keyword].present?
      @recommends = Recommend.where('title LIKE ?', "%#{params[:keyword]}%")
    else
      @recommends = Recommend.none
    end
  end

  def rakuten_search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end


  private
  def recommend_params
    params.require(:recommend).permit(:title,:outher,:publisher,:body)
  end
end
