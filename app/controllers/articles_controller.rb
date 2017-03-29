class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update]
    #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    def index
        @articles = Article.paginate(page: params[:page], per_page: 4).order(created_at: :desc)
        
    end
    
 
    def show
        
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        
        if @article.save
            flash[:success] = "Your article was created successfully!"
           redirect_to @article
        else
           render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @article.update(article_params)
           redirect_to @article
        else
           render 'edit'
        end
    end
    
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
 
        redirect_to articles_path
    end
    
    private
    
        def article_params
            params.require(:article).permit(:title, :text)
        end
        
        def set_article
            @article = Article.find(params[:id])
        end
        
        def require_same_user
            if current_user != @article.user
                flash[:danger] = "You can only edit your own articles"
                redirect_to articles_path
            end
        end 
end
