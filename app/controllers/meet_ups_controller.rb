class MeetUpsController < BaseController

  before_action :authenticate_user, only: [:create]
  before_action :set_meet_up, only: [:show, :destroy]

  def index
    @meet_ups = MeetUp.all
  end

  def show
    @comments = @meet_up.comments.order(index: :asc)
  end

  def create
    @meet_up = current_user.meet_ups.build(meet_up_params)
    @meet_up.save
  end


  private

  def set_meet_up
    @meet_up = MeetUp.find_by(id: params[:id])
  end

  def meet_up_params
    params.require(:meet_up).permit(:title, :content)
  end

end
