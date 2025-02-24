# frozen_string_literal: true

class TasksController < ApplicationController
  # allow_unauthenticated_access only: %i[ index ]
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    tasks = Current.user.tasks.order(expiration_date: :asc).group_by(&:status)
    @in_progress_tasks  = tasks.fetch("in_progress", [])
    @completed_tasks    = tasks.fetch("completed", [])
    # @archived_tasks     = tasks.fetch("archived", [])
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Current.user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task = Current.user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path, status: :see_other, notice: "Task was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.expect(task: %i[name description expiration_date status])
  end
end
