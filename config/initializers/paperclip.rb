Paperclip::Attachment.default_options[:url] = ':s3_alias_url'
Paperclip::Attachment.default_options[:path] = '/blog/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-ap-southeast-1.amazonaws.com'