class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    if user_signed_in?
      @comment = Comment.new(comment_params)
      @comment.post_id = params[:post_id]
      @comment.user=current_user
      #you need to assign the post_id not post. Assigning post is not allowed in rails which means-->
      #@comment.post=params[:post] is invalid
      respond_to do |format|
        if @comment.save
          format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @comment}
          format.js
        else
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_back fallback_location: root_path, notice: 'You need to sign in to comment.'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if current_user==@comment.user
      post=@comment.post
      @comment.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
        format.js
      end
    else
      redirect_back fallback_location: root_path, notice: 'You are not signed in or the comment does not belong to you'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post, :name)
    end
end
  