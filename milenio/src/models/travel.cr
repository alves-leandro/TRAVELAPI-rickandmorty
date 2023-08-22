class Travel < BaseModel
  table do
    column travel_stops : Array(Int32)
  end
end
