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
require 'json'

module Cb
  module Clients
    class Education
      def self.get_for(country)
        Cb::Utils::Country.is_valid? country ? country : 'US'
        my_api = Cb::Utils::Api.instance
        json_hash = my_api.cb_get(Cb.configuration.uri_education_code, query: { countrycode: country })

        codes = []
        if json_hash.key?('ResponseEducationCodes')
          if json_hash['ResponseEducationCodes'].key?('EducationCodes') &&
             json_hash['ResponseEducationCodes']['EducationCodes'].key?('Education')
            json_hash['ResponseEducationCodes']['EducationCodes']['Education'].each do |education|
              codes << Cb::Models::Education.new(education)
            end
          end
          my_api.append_api_responses(codes, json_hash['ResponseEducationCodes'])
        end

        my_api.append_api_responses(codes, json_hash)
      end
    end
  end
end
