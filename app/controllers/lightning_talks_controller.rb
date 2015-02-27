class LightningTalksController < ApplicationController
  before_action :set_lightning_talk, only:[:show, :edit, :update]

  def index
    @lightning_talks = LightningTalk.all
  end

  def show
    @user = User.find(@lightning_talk.user_id)
  end

  def new
    @lightning_talk = LightningTalk.new
  end

  def create
    @lightning_talk = LightningTalk.new(lightning_talk_params)
    @lightning_talk.user_id = current_user.id
    if @lightning_talk.save
      flash[:notice] = 'You have signed up for a new lightning talk'
      redirect_to lightning_talk_path(@lightning_talk)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lightning_talk.update(lightning_talk_params)
      flash[:notice] = 'You have updated your lightning talk'
      redirect_to lightning_talk_path(@lightning_talk)
    else
      render :edit
    end
  end

  private

  def lightning_talk_params
    params.require(:lightning_talk).permit(:user, :description, :date, :talk_time)
  end

  def set_lightning_talk
    @lightning_talk = LightningTalk.find(params[:id])
  end

end
