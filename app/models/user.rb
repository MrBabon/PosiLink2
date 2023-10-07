class User < ApplicationRecord
  ########## RATACHEMENT ENTRE LES TABLES ##########
  # has_many :messages, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  has_many :participating_events, through: :participations, source: :event
  ##################################################

  ############ VALIDATION ############
  validates :nickname, presence: true, format: { without: /\s/ }
  ####################################
    
  ############# DEVISE #############
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ##################################
end
