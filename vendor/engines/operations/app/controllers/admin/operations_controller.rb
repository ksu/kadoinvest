module Admin
  class OperationsController < Admin::BaseController

    crudify :operation, :xhr_paging => true

  end
end
