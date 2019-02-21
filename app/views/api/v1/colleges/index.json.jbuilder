json.status true
json.total @colleges.count
json.colleges @colleges, partial: 'api/v1/colleges/college', as: :college