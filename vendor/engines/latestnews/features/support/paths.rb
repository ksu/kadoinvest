module NavigationHelpers
  module Refinery
    module Latestnews
      def path_to(page_name)
        case page_name
        when /the list of latestnews/
          admin_latestnews_path

         when /the new latestnew form/
          new_admin_latestnew_path
        else
          nil
        end
      end
    end
  end
end
