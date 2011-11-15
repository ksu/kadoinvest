module Admin
  class NewsfeedsController < Admin::BaseController

    crudify :newsfeed, :xhr_paging => true

  end
end
