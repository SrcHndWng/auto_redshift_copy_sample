require 'command_settings'

module AutoRedshiftCopySample
  class Command
    def read(file_name)
      File.open(CommandSettings.path[file_name]) do |file|
        return file.read.
            gsub('{$BUCKET}', Settings.s3.bucket).
            gsub('{$FOLDER}', Settings.s3.folder).
            gsub('{$FILE_NAME}', file_name).
            gsub('{$AWS_ACCESS_KEY_ID}', Settings.credential.access_key).
            gsub('{$AWS_SECRET_ACCESS_KEY}', Settings.credential.secret_access_key)
      end
    end
  end
end