class Admin::LightningTalksController < ApplicationController
  before_action :set_lightning_talk, only:[:show, :edit, :update]

  def index
    @lightning_talks = LightningTalk.all
  end

  def show
  end

  def create
    @lightning_talk = LightningTalk.new(lightning_talk_params)
    if @lightning_talk.save
      flash[:notice] = 'You have signed up for a new lightning talk'
      redirect_to admin_lightning_talks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lightning_talk.update(lightning_talk_params)
      flash[:notice] = 'You have updated your lightning talk'
      redirect_to admin_lightning_talks_path
    else
      render :edit
    end
  end

  def destroy
    lightning_talk = LightningTalk.find(params[:id])
    lightning_talk.destroy
    flash[:notice] = 'You are too scared to give a lightning talk?'
    redirect_to admin_lightning_talks_path
  end

  private

  def lightning_talk_params
    params.require(:lightning_talk).permit(:user, :description, :date)
  end

  def set_lightning_talk
    @lightning_talk = LightningTalk.find(params[:id])
  end

end