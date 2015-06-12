class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :dob, type: Date
  field :uid, type: String
  field :email, type: String
  field :provider, type: String
  field :image, type: String
  field :access_token, type: String
  include Mongoid::Timestamps

  mount_uploader :image, ImageUploader

  validates :email, :uid, :provider, :first_name, presence: true

  class << self
    def create_with_provider(user_param) 
      create!(provider: user_param[:provider],
              uid: user_param[:uid],
              email: user_param[:email],
              first_name: user_param[:first_name],
              last_name: user_param[:last_name],
              remote_image_url: user_param[:remote_image_url]
             )
    end
  end

end
