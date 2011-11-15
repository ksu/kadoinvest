class NewsfeedsController < ApplicationController

  before_filter :find_all_newsfeeds
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsfeed in the line below:
    present(@page)
  end

  def show
    @newsfeed = Newsfeed.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsfeed in the line below:
    present(@page)
  end

protected

  def find_all_newsfeeds
    @newsfeeds = Newsfeed.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/newsfeeds").first
  end

end
