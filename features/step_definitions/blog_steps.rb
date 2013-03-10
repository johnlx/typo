Given /the following articles exist/ do |articles_table|
  #@movies_count = movies_table.count
  articles_table.hashes.each do |article|
    new_article = Article.new article
    new_article.save!
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  @articles_count =  articles_table.hashes.size
  #flunk "Unimplemented"
end
