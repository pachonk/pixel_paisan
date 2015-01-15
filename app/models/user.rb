class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :palettes, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :galleries, dependent: :destroy

  validates :name, uniqueness: true

  after_create :create_galleries

  def create_galleries
    self.galleries.create
  end

end
