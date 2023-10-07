class Organization < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_organization,
                  against: [:name, :category],
                  using: {
                      tsearch: { prefix: true }
                  }
end
