class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable
         
  has_many :identities
  
  ROLES = %w[admin teacher student user]
  
  attr_accessor :login
  
  validates_uniqueness_of :username, case_sensitive: false
  validate :students_belong_to_a_course
  validate :non_students_do_not_belong_to_a_course
  
  belongs_to :course
  
  def full_name
    ([first_name, last_name] - ['']).compact.join(' ')
  end
  
  def self.create_from_omniauth(auth)
    identity = Identity.where(auth.slice(:provider, :uid)).first || Identity.from_omniauth(auth)
    
    where(id: identity.user_id).first_or_create do |user|
      user.populate_from_auth(auth, identity)
    end
  end
  
  def update_from_omniauth(auth)
    identity = Identity.where(auth.slice(:provider, :uid)).first || Identity.from_omniauth(auth)
    
    populate_from_auth(auth, identity)
    save!
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
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value or lower(unconfirmed_email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def populate_from_auth(auth, identity)
    self.username = auth["info"].try(:fetch, "nickname", nil) || self.username
    self.email = auth["info"].try(:fetch, "email", nil) || self.email
    self.username = email[/[^@]+/] if self.username.blank? && !self.email.blank?
    self.first_name = auth["info"].try(:fetch, "first_name", nil) || self.first_name
    self.last_name = auth["info"].try(:fetch, "last_name", nil) || self.last_name
    
    self.identities << identity
  end
  
  def admin?
    (self.role == "admin")
  end
  
  private
    def students_belong_to_a_course
      errors.add(:course, " should be associated with a course" ) if self.role == "student" && self.course_id.nil?
    end
    
    def non_students_do_not_belong_to_a_course
      errors.add(:course, " should be associated with a course" ) if self.role != "student" && self.course_id.present?
    end
end
