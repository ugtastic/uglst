module Import
  module PhpUg
    class ExtractJob
      include Sidekiq::Worker

      def perform
        user_groups_data.each do |user_group_data|
          if process?(user_group_data)
            Import::PhpUg::TransformJob.perform_in(30.seconds.from_now, user_group_data)
          end
        end
      end

      def process?(_user_group_data)
        # check if this UG has already been loaded

        true
      end

      def api_url
        'http://php.ug/api/rest/listtype.json/1'
      end

      def user_groups_data
        response = RestClient.get(api_url, accept: :json)

        unless 200 == response.code
          fail "Could not fetch from #{api_url} because received HTTP status #{response.code}"
        end

        MultiJson.load(response)['groups']
      end
    end
  end
end
