require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do

    @current_user = FactoryGirl.create(:user, name: 'test', email: 'test@email.com', password: '111111', password_confirmation: '111111')
    @meet_up = FactoryGirl.create(:meet_up, user_id: @current_user.id)
    @anoter_meet_up = FactoryGirl.create(:meet_up, user_id: @current_user.id)
  end

  it "添加评论的时候没有关联上对应的MeetUp不能创建" do
    begin
      @comment = FactoryGirl.create(:comment, user_id: @current_user.id)
    rescue Exception => e
      nil
    end
    expect(Comment.count).to eq 0
  end

  it "添加评论的时候没有当前用户不能创建" do
    begin
      @comment = @meet_up.comments.build(content: 'this is test')
    rescue Exception => e
      nil
    end
    expect(Comment.count).to eq 0
  end

  it "用户和MeetUp都关联上的时候才能创建成功" do
    begin
      @comment = @meet_up.comments.build(content: 'this is test', user_id: @current_user.id)
      @comment.save
    rescue Exception => e
      nil
    end
    expect(Comment.count).to eq 1
    expect(@comment.index).to eq 1

    @comment = @meet_up.comments.build(content: 'this is another test', user_id: @current_user.id)
    @comment.save

    expect(Comment.count).to eq 2
    expect(@comment.index).to eq 2
  end

  it "用户在添加评论的时候有正确的楼号" do
    begin
      @comment = @meet_up.comments.build(content: 'this is test', user_id: @current_user.id)
      @comment.save
    rescue Exception => e
      nil
    end
    expect(Comment.count).to eq 1
    expect(@comment.index).to eq 1

    @comment = @meet_up.comments.build(content: 'this is another test', user_id: @current_user.id)
    @comment.save

    expect(Comment.count).to eq 2
    expect(@comment.index).to eq 2

    begin
      @comment = @anoter_meet_up.comments.build(content: 'this is another else test', user_id: @current_user.id)
      @comment.save
    rescue Exception => e
      nil
    end

    expect(Comment.count).to eq 3
    expect(@comment.index).to eq 1
  end
end
