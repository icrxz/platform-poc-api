# frozen_string_literal: true

Aws.config.update(
  region: 'sa-east-1',
  credentials:
      Aws::Credentials.new(Rails.application.credentials.aws_key,
                           Rails.application.credentials.aws_secret)
)

AWS_BUCKET = Aws::S3::Resource.new.bucket('modularflix')