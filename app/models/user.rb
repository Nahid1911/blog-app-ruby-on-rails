class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :commets
  has_many :likes

  attribute :name, :string
  attribute :bio, :text
  attribute :post_counter, :integer, default: 0
  attribute :photo, :string

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
