module NavigationHelpers
  module Refinery
    module Operations
      def path_to(page_name)
        case page_name
        when /the list of operations/
          admin_operations_path

         when /the new operation form/
          new_admin_operation_path
        else
          nil
        end
      end
    end
  end
end
