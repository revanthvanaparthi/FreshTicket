json.extract! ticket, :id, :item, :description, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
