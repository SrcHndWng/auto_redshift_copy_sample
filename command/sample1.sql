COPY sample1
FROM 's3://{$BUCKET}/{$FOLDER}/{$FILE_NAME}' -- {$BUCKET}、{$FOLDER}、{$FILE_NAME}はapplication.ymlに定義した値で置き換えられる
DELIMITER ','
CSV QUOTE AS '"'
gzip
IGNOREHEADER 0
CREDENTIALS 'aws_access_key_id={$AWS_ACCESS_KEY_ID};aws_secret_access_key={$AWS_SECRET_ACCESS_KEY}'; -- {$AWS_ACCESS_KEY_ID}、{$AWS_SECRET_ACCESS_KEY}はapplication.ymlに定義した値で置き換えられる
