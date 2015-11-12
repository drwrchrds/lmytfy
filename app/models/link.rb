class Link < ActiveRecord::Base
    validates :find_desc, uniqueness: {scope: :loc}
    validates :slug, uniqueness: true
    before_create :generate_slug

    def generate_slug
        slug = SecureRandom.urlsafe_base64(4)
        while Link.exists?(slug: slug)
            slug = SecureRandom.urlsafe_base64(4)
        end

        self.slug = slug
    end
end