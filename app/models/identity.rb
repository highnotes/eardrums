class Identity < ActiveRecord::Base
  belongs_to :user
    
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |identity|
      identity.provider = auth["provider"]
      identity.uid = auth["uid"]
    end
  end
end
