json.array!(@buckets) do |bucket|
	json.title bucket.name
	json.value root_url+bucket.attachment_url
end
