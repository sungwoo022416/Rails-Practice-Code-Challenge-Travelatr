class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        self.posts.max_by {|post| post.likes}
    end

    def average_age
       avg = self.bloggers.map {|blogger| blogger.age}.uniq
       avg.sum / avg.count
    end

    def recent_posts
        self.posts.last(5)
    end
end
