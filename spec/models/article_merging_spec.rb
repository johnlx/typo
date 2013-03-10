require 'spec_helper'


describe Article do

  before do
    @blog = stub_model(Blog)
    @blog.stub(:base_url) { "http://myblog.net" }
    @blog.stub(:text_filter) { "textile" }
    @blog.stub(:send_outbound_pings) { false }

    Blog.stub(:default) { @blog }

    @articles = []
  end


  describe "merge articles" do
    before do
      @article = Article.create!(:title => "Article one", :author=>"Me", :body=> "Article1 Content")
      @article.comments.build({:body => 'Article One Comment', :author => 'a_commenter', :email => 'bob@home', :url => 'http://bobs.home/'})
      @article.save
      @second_article = Article.create!(:title => "Second Article", :author=>"someone", :body=>"Second article content")
      @second_article.comments.build({:body => 'Article Two Comment', :author => 'b_commenter', :email => 'bob@home', :url => 'http://bobs.home/'})
      @second_article.save
    end

    it "should combine body for both articles" do
      @article.merge_with(@second_article.id)
      @article.body.should match "Second article content"
    end

    it "should combine comments for both articles" do
      @article.merge_with(@second_article.id)
      #@article = Article.find_by_title "Article one"
      @article.comments.size.should == 2

    end

    it "should remove the merged article" do
      @article.merge_with(@second_article)

      Article.find_by_title("Second Article").should == nil
    end

  end

end