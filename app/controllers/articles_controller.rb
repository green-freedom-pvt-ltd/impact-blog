class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :create]

  # GET /articles
  # GET /articles.json
  def index
    @meta_description = "Impact - Get Fit. Do Good."
    @title = "Impact"
    # @images = ["https://s3-ap-southeast-1.amazonaws.com/bewakoof-blog/BeBewakoof.jpg","https://s3-ap-southeast-1.amazonaws.com/bewakoof-blog/color_of_logo.jpg"]
    @articles = Article.order('articles.created_at DESC')
    @articles = @articles.active unless current_user.present? 
  end

  # GET /articles/latest
  def latest
    render json: {creation_time: Article.active.last.created_at.to_i}
  end

  def howitworks
    @data = File.read("#{Rails.root}/public/how_it_works.json")
    render :json => @data
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    redirect_to articles_path if @article.status == "inactive" and current_user.blank?
    @title = @article.title
    @images = [@article.banner_image]
    @article.short_description
    @meta_description = @article.meta_description
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    respond_to do |format|
      if @article.save
        format.html {redirect_to articles_path } if @article.status == "inactive"
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to articles_path } if @article.status == "inactive"
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by(url_title: params[:id])
      @article = Article.find_by(id: params[:id]) if @article.blank?
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:content, :meta_description, :short_description, :title, :banner_image, :user_id, :status, :banner_image_show)
    end
end
