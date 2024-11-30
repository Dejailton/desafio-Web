json.extract! tarefa, :id, :name, :custo, :datalimite, :ordem, :created_at, :updated_at
json.url tarefa_url(tarefa, format: :json)
