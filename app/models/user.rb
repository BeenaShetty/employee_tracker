class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :dob, type: Date
  field :uid, type: String
  field :email, type: String
  field :provider, type: String
  field :image, type: String
  include Mongoid::Timestamps

  mount_uploader :image, ImageUploader

  validates :email, :uid, :provider, :first_name, presence: true

  class << self
    def create_with_provider(provider, uid, info)
      create!(provider: provider,
              uid: uid, 
              email: info["email"],
              first_name: info["first_name"],
              last_name: info["last_name"],
              remote_image_url: info["image"]
             )
    end
  end

end
