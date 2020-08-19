class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit ,:update]

    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params) #データを保存する箱を作る
        if @article.save #データを保存する
            redirect_to article_path(@article),notice: '保存出来ました'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to article_path(@article), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    def destroy
       article = Article.find(params[:id])
       article.destroy!
       redirect_to '/', notice: '削除に成功しました'
    end

    private #ストロングパラメーターを使う際はpravateを使う
    def article_params #更新する対象_paramsで書く
        params.require(:article).permit(:title, :content) #データ改竄を防ぐために記事形式のタイトルとコンテンツ以外は保存しないようになっている
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
