class Tarefa < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :custo, presence: true
  validates :ordem, presence: true
  validates :datalimite, presence: true
end
