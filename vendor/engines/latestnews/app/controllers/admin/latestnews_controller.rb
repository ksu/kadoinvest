module Admin
  class LatestnewsController < Admin::BaseController

    crudify :latestnew, :xhr_paging => true

  end
end
