class OperationsController < ApplicationController

  before_filter :find_all_operations
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @operation in the line below:
    present(@page)
  end

  def show
    @operation = Operation.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @operation in the line below:
    present(@page)
  end

protected

  def find_all_operations
    @operations = Operation.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/operations").first
  end

end
