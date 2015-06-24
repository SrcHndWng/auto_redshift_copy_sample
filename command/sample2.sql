COPY sample2
FROM 's3://{$BUCKET}/{$FOLDER}/{$FILE_NAME}'
DELIMITER ','
CSV QUOTE AS '"'
gzip
IGNOREHEADER 0
CREDENTIALS 'aws_access_key_id={$AWS_ACCESS_KEY_ID};aws_secret_access_key={$AWS_SECRET_ACCESS_KEY}';
