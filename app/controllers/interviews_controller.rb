class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[edit update show destroy]
  def index
    @interviews = Interview.all
  end

  def show; end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.created_by = current_user
    if @interview.save
      redirect_to interviews_path, notice: 'Interview was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @interview.update(interview_params)
      redirect_to interviews_path, notice: 'Interview has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @interview.destroy
      redirect_to interviews_path, notice: 'Interview Feedback has been deleted.'
    else
      redirect_to interviews_path, alert: 'Failed to delete Interview Feeback.'
    end
  end

  private

  def interview_params
    params.require(:interview).permit(:profile_id, :company, :point_of_contact, :date, :follow_up_date,
                                      :feedback, :status, :mode, :created_by)
  end

  def set_interview
    @interview = Interview.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to interviews_path, notice: e
  end
end
