class Tarefa < ApplicationRecord
  after_destroy :reordenar_posicoes

  validates :name, presence: true, uniqueness: true
  validates :custo, presence: true
  validates :ordem, presence: true
  validates :datalimite, presence: true
  
  def reordenar_posicoes
    self.class.where('ordem > ?', ordem).update_all('ordem = ordem - 1')
  end
end
