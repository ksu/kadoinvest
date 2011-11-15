module NavigationHelpers
  module Refinery
    module Newsfeeds
      def path_to(page_name)
        case page_name
        when /the list of newsfeeds/
          admin_newsfeeds_path

         when /the new newsfeed form/
          new_admin_newsfeed_path
        else
          nil
        end
      end
    end
  end
end
