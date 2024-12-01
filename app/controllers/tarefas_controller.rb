class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[ show edit update destroy priorize depriorize ]

  # GET /tarefas or /tarefas.json
  def index
    @tarefas = Tarefa.order("ordem")
    @tarefasall = Tarefa.all
    @tarefa = Tarefa.new
  end

  # GET /tarefas/1 or /tarefas/1.json
  def show
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new(tarefa_parms)
  end

  # GET /tarefas/1/edit
  def edit
  end

  # POST /tarefas or /tarefas.json
  def create
    if @tarefa = Tarefa.new(tarefa_params)
      @tarefa.ordem = Tarefa.count + 1
    else 
      @tarefa.ordem = Tarefa.count
    end
    respond_to do |format|
      if @tarefa.save
        format.html { redirect_to index, notice: "Tarefa was created successfully" }
        format.json { render :show, status: :created, location: @tarefa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefas/1 or /tarefas/1.json
  def update
    respond_to do |format|
      if @tarefa.update(tarefa_params)
        format.html { redirect_to @tarefa, notice: "Tarefa was updated successfully!" }
        format.json { render :show, status: :ok, location: @tarefa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefas/1 or /tarefas/1.json
  def destroy
    @tarefaordem = @tarefa.ordem
    @tarefasall.each do |tarefa|
      tarefa.where("ordem > @tarefaordem").order("ordem desc")  
    end
    @tarefa.destroy!
    respond_to do |format|
      format.html { redirect_to tarefas_path, status: :see_other, notice: "Tarefa was deleted with sucessfully!" }
      format.json { head :no_content }
    end
  end

  #PRIORIZE /tarefas/1 or tarefas/1.json
  def priorize
    
  end

  #DEPRIORIZE /tarefas/1
  def depriorize
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tarefa_params
      params.expect(tarefa: [ :name, :custo, :datalimite, :ordem ])
    end
end
