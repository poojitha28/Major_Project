module Rapidfire
  class AnswerGroupsController < Rapidfire::ApplicationController
    before_filter :find_question_group!

    def new
      @id = @question_group.category
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
    end

    def create
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
      id = @question_group.category
      if @answer_group_builder.save
        flash[:notice] = "Your Responses has been Recorded Successfully"
        if id == "B.Tech" or id == "M.Tech"
           redirect_to "/program"
        else
          redirect_to "/course/#{id}"
       end
      else
        render :new
      end
    end

    private
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end

    def answer_group_params
      answer_params = { params: (params[:answer_group] || {}) }
      answer_params.merge(user: current_user, question_group: @question_group)
    end
  end
end
