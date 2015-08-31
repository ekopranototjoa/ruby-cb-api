# Copyright 2015 CareerBuilder, LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
module Cb
  module Clients
    class AnonSavedSearch
      def create(*args)
        body = new_model(*args).create_anon_to_xml
        json = cb_client.cb_post(create_uri, body: body)
        Responses::AnonymousSavedSearch::Create.new(json)
      end

      def delete(*args)
        body = new_model(*args).delete_anon_to_xml
        json = cb_client.cb_post(delete_uri, body: body)
        Responses::AnonymousSavedSearch::Delete.new(json)
      end

      private

      def new_model(*args)
        return args.first if args.respond_to?(:[]) && args.first.is_a?(Models::SavedSearch)
        Models::SavedSearch.new(extract_args(*args))
      end

      def extract_args(*args)
        args.is_a?(Array) && args.count == 1 ? args[0] : args
      end

      def create_uri
        Cb.configuration.uri_anon_saved_search_create
      end

      def delete_uri
        Cb.configuration.uri_anon_saved_search_delete
      end

      def cb_client
        @cb_client ||= Cb::Utils::Api.instance
      end
    end
  end
end
