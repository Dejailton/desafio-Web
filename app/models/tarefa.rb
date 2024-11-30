class Tarefa < ApplicationRecord
  validates :name, presence: true
  validates :custo, presence: true
  validates :datalimite, presence: true
  validates :ordem, presence: true, comparison: { less_than_or_equal_to: Tarefa.count + 1 }
end
