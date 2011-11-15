module NavigationHelpers
  module Refinery
    module News
      def path_to(page_name)
        case page_name
        when /the list of news/
          admin_news_path

         when /the new new form/
          new_admin_new_path
        else
          nil
        end
      end
    end
  end
end
