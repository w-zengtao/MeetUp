module MeetUps
  class CommentsController < ::BaseController

    before_action :set_meet_up, only: [:create]
    before_action :authenticate_user, only: [:create]

    def create
      @comment = @meet_up.comments.build(comment_params.merge(user_id: current_user.id))
      # @comment.index = @meet_up.comments.count + 1
      @comment.save
    end

    private
    def comment_params
      params.fetch(:comment, {}).permit(:content)
    end

    def set_meet_up
      @meet_up = MeetUp.find_by(id: params[:meet_up_id])
    end
  end
end
