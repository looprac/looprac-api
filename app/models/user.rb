class User < ActiveRecord::Base
  before_create :assign_uuid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def assign_uuid
    self.uuid = UUIDTools::UUID.timestamp_create().to_s.upcase if uuid.blank?
  end
end
