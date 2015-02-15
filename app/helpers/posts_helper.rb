module PostsHelper
	def tag_links(tags)
    	tags.split(",").map{|tag| link_to (tag.sub "#", "").strip, tag_path(tag.strip) }.join(", ")
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
      #text.sub(hash_tags.hash_t, tag_links(hash_t.sub "#", "").to_s)
    end
    for i in 0..hash_tags.length
      text = text.sub(hash_tags[i].to_s, nonhash_tags[i].to_s)
    end
    p text


    # text_hashtags.each do |tag|
    #   #link_to tag, tag_path(tag)
    #  # p "This is original #{tag}"
    #   #p tag.sub "#", ""
    #   #p tag.gsub(/"#"/, ' ')
    # text.sub(hashtag_regex, 'Link')
    #  end
  end

end
