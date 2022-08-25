class CommentsController < ApplicationController

    def index
        @article=Article.find(params[:article_id])
        @comments=@article.comments.all
        render json: @comments
    end

    def show
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        render json: @comment
    end

    def create
        @article= Article.find(params[:article_id])
        @comment=@article.comments.create(comment_params)
        render json: @comment, status: :created
    end

    def update
        @article = Article.find(params[:article_id])
        @comment=@article.comments.find(params[:id])

        if @comment.update(comment_params)
            render json: @comment
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment=@article.comments.find(params[:id])
        @comment.destroy
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
