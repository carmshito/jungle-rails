class User < ApplicationRecord

    has_secure_password

    # verify email field is not blank and doesn't already exist in db
    validates :email, presence: true, uniqueness: true
end

