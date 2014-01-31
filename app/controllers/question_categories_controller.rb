class QuestionCategoriesController < ApplicationController
  before_action :set_question_category, only: [:show, :edit, :update, :destroy]

  # GET /question_categories
  # GET /question_categories.json
  def index
    @question_categories = QuestionCategory.paginate(:page => params[:page])
  end

  # GET /question_categories/1
  # GET /question_categories/1.json
  def show
  end

  # GET /question_categories/new
  def new
    @question_category = QuestionCategory.new
  end

  # GET /question_categories/1/edit
  def edit
  end

  # POST /question_categories
  # POST /question_categories.json
  def create
    @question_category = QuestionCategory.new(question_category_params)

    respond_to do |format|
      if @question_category.save
        format.html { redirect_to @question_category, notice: 'Question category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_categories/1
  # PATCH/PUT /question_categories/1.json
  def update
    respond_to do |format|
      if @question_category.update(question_category_params)
        format.html { redirect_to @question_category, notice: 'Question category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_categories/1
  # DELETE /question_categories/1.json
  def destroy
    @question_category.destroy
    respond_to do |format|
      format.html { redirect_to question_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_category
      @question_category = QuestionCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_category_params
      params.require(:question_category).permit(:question_id, :category_id)
    end
end
