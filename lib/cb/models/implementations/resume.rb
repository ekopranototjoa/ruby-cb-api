module Cb
  module Models
    class Resume < ApiResponseModel
      attr_accessor :user_identifier, :resume_hash, :privacy_setting, :work_experience, :salary_information,
                    :educations, :skills_and_qualifications, :relocations, :government_and_military

      def set_model_properties
        args = api_response
        @user_identifier = args['userIdentifier']
        @resume_hash = args['resumeHash']
        @privacy_setting = args['privacySetting']
        @work_experience = extract_work_experience
        @salary_information = extract_salary_information
        @educations = extract_educations
        @skills_and_qualifications = extract_skills_and_qualifications
        @relocations = extract_relocations
        @government_and_military = extract_government_and_military

      end

      def required_fields
        ['userIdentifier']
      end

      private
      def extract_work_experience
        api_response['workExperience'].collect do |experience|
          Resumes::WorkExperience.new(experience)
        end
      end

      def extract_salary_information
        Resumes::SalaryInformation.new(api_response['salaryInformation'])
      end

      def extract_educations
        api_response['educations'].collect do |education|
          Resumes::Education.new(education)
        end
      end

      def extract_skills_and_qualifications

      end

      def extract_relocations

      end

      def extract_government_and_military

      end
    end
  end
end
