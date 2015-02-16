module PostsHelper
	def tag_links(tags)
    	tags.split(",").map{|tag| link_to (tag.sub "#", "").strip, tag_path((tag.downcase).strip) }.join(", ")
  end

   def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
   end

  def process_hashtags(text)
    hashtag_regex = /\B#\w\w+/
    hash_tags = text.scan(hashtag_regex)
    nonhash_tags=[]

    hash_tags.each do |hash_t|
      nonhash_tags << tag_links(hash_t)
    end

    for i in 0..hash_tags.length
      text = text.sub(hash_tags[i].to_s, nonhash_tags[i].to_s)
    end
     text
  end

end
