class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}
    validates :age, numericality: {greater_than: 0}

    def featured_post
        self.posts.max_by(1) {|post| post.likes}
    end

    def five_featured_posts
        self.posts.max_by {|post| post.likes}
    end

    def clean_post
            featured_post.map {|post| post.title}
    end

end
