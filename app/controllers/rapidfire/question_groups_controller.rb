module Rapidfire
  class QuestionGroupsController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!, except: [ :index, :view, :program]
     def view
      @question_groups = QuestionGroup.where(category: params[:cat_id])
    end
    def program
      @question_groups = QuestionGroup.where(category: ["M.Tech","B.Tech"])
    end
    def index
     
    end

    def new
      @question_group = QuestionGroup.new
    end

    def create
      @question_group = QuestionGroup.new(question_group_params)
      if @question_group.save
        flash[:notice] = "Survey Created Successfully"
        respond_to do |format|
          format.html { redirect_to question_group_questions_path(@question_group.id) }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.js
        end
      end
    end

    def destroy
      @question_group = QuestionGroup.find(params[:id])
      @question_group.destroy
      respond_to do |format|
        format.html { redirect_to question_groups_path }
        format.js
      end
    end

    def results
      @question_group = QuestionGroup.find(params[:id])
      @question_group_results = QuestionGroupResults.new(question_group: @question_group).extract
      @id = @question_group.category
      respond_to do |format|
        format.json { render json: @question_group_results, root: false }
        format.html
        format.js
      end
    end

    private

    def question_group_params
        params.require(:question_group).permit(:name, :category)
    end
  end
end
