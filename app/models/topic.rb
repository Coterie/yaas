class Topic < ActiveRecord::Base
has_many :posts
belongs_to :forum
belongs_to :user
validates_presence_of :title
end
