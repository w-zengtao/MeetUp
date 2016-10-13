module Api
  class MeetUpsController < BaseController

    before_action :authenticate_user
    # def show
    # end
    def index
      @meet_ups = MeetUp.all
      render json: { meet_ups: @meet_ups }
    end
  end
end
