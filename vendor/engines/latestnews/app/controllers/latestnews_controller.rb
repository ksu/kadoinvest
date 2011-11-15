class LatestnewsController < ApplicationController

  before_filter :find_all_latestnews
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @latestnew in the line below:
    present(@page)
  end

  def show
    @latestnew = Latestnew.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @latestnew in the line below:
    present(@page)
  end

protected

  def find_all_latestnews
    @latestnews = Latestnew.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/latestnews").first
  end

end
