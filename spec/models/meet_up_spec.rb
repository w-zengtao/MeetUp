require 'rails_helper'

RSpec.describe MeetUp, type: :model do
  before do
    @current_user = FactoryGirl.create(:user, name: 'test', email: 'test@email.com', password: '111111', password_confirmation: '111111')
  end

  it "创建MeetUp的时候必须有对应的 current_user" do
    begin
      @meet_up = FactoryGirl.create(:meet_up)
    rescue Exception => e
      nil
    end
    expect(MeetUp.count).to eq 0

    begin
      @meet_up = FactoryGirl.create(:meet_up, user_id: @current_user.id)
    rescue Exception => e
      nil
    end
    expect(MeetUp.count).to eq 1
  end
end
