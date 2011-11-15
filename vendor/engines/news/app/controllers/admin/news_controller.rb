module Admin
  class NewsController < Admin::BaseController

    crudify :new, :xhr_paging => true

  end
end
