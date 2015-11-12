class Link < ActiveRecord::Base
  validates :find_desc, uniqueness: {scope: :loc}
  validates :slug, uniqueness: true
end