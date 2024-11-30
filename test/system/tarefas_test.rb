require "application_system_test_case"

class TarefasTest < ApplicationSystemTestCase
  setup do
    @tarefa = tarefas(:one)
  end

  test "visiting the index" do
    visit tarefas_url
    assert_selector "h1", text: "Tarefas"
  end

  test "should create tarefa" do
    visit tarefas_url
    click_on "New tarefa"

    fill_in "Custo", with: @tarefa.custo
    fill_in "Datalimite", with: @tarefa.datalimite
    fill_in "Name", with: @tarefa.name
    fill_in "Ordem", with: @tarefa.ordem
    click_on "Create Tarefa"

    assert_text "Tarefa was successfully created"
    click_on "Back"
  end

  test "should update Tarefa" do
    visit tarefa_url(@tarefa)
    click_on "Edit this tarefa", match: :first

    fill_in "Custo", with: @tarefa.custo
    fill_in "Datalimite", with: @tarefa.datalimite
    fill_in "Name", with: @tarefa.name
    fill_in "Ordem", with: @tarefa.ordem
    click_on "Update Tarefa"

    assert_text "Tarefa was successfully updated"
    click_on "Back"
  end

  test "should destroy Tarefa" do
    visit tarefa_url(@tarefa)
    click_on "Destroy this tarefa", match: :first

    assert_text "Tarefa was successfully destroyed"
  end
end
