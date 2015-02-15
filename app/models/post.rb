class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  #after_save :process_hashtags

  def process_hashtags
    hashtag_regex = /\B#\w\w+/
    text_hashtags = text.scan(hashtag_regex)
    text_hashtags.each do |tag|
      hashtags.create name: tag
    end
  end

 #Getter and Setter for all_tags vertial attribute
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
	  self.tags.map(&:name).join(", ")
  end
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

end
