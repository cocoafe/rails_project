json.array!(@logs) do |log|
  json.extract! log, :id, :alien_id, :product_id, :destination_id, :stage, :created_date, :close_date, :closed, :setup_charge, :revenue_month
  json.url log_url(log, format: :json)
end
