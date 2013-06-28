class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
         
  has_many :identities
  
  def full_name
    ([first_name, last_name] - ['']).compact.join(' ')
  end
    
  def self.create_from_omniauth(auth)
    # Identity will always be created before this code is executed
    identity = Identity.where(auth.slice(:provider, :uid)).first
    where(id: identity.user_id).first_or_create do |user|
      # UserName will get defaulted to the first registered identity's nickname
      user.username = auth["info"].try(:fetch, "nickname", nil)
      
      if user.username.blank?
        email = auth["info"].try(:fetch, "email", nil)
        user.username = email[/[^@]+/] unless email.blank?
      end
      
      user.email = auth["info"].try(:fetch, "email", nil)
      user.first_name = auth["info"].try(:fetch, "first_name", nil)
      user.last_name = auth["info"].try(:fetch, "last_name", nil)
      
      user.identities << identity
    end
  end
  
  def self.update_from_omniauth(auth)
    identity = Identity.where(auth.slice(:provider, :uid)).first
    user = User.where(id: identity.user_id).first
    
    user.username = auth["info"].try(:fetch, "nickname", nil) unless auth["info"].try(:fetch, "nickname", nil)
    
    if user.username.blank?
      email = auth["info"].try(:fetch, "email", nil)
      user.username = email[/[^@]+/] unless email.blank?
    end
    
    #Don't update email, may cause problems of uniqueness
    #user.email = auth["info"].try(:fetch, "email", nil) unless auth["info"].try(:fetch, "email", nil).nil?

    user.first_name = auth["info"].try(:fetch, "first_name", nil) unless auth["info"].try(:fetch, "first_name", nil).nil?
    user.last_name = auth["info"].try(:fetch, "last_name", nil)unless auth["info"].try(:fetch, "first_name", nil).nil?
    
    user.identities << identity
    
    user.save!
  end
  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        
        # Populate identity
        if session["devise.user_identity"]
          identity = Identity.find(session["devise.user_identity"])
          user.identities << identity
        end
        
        user.valid?
      end
    else
      super
    end    
  end
  
  def password_required?
    super && identities.empty?
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
