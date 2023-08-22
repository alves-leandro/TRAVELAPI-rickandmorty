class Api::Get::Index < ApiAction
  get "/travel_plans" do
    expand = params.get?(:expand)
    optimize = params.get?(:optimize)
    
    travels = TravelQuery.new

    travels.each do |travel|
      travel_stops = travel.travel_stops
    
      if optimize
        sorted_stops = travel_stops.map do |stop|
          url = "http://rickandmortyapi.com/api/location/#{stop}"
          response = Crest.get(url)
    
          if response.status_code == 200
            location = JSON.parse(response.body)
            residents = location["residents"] || [] of JSON::Any
    
            {
              id: location["id"].to_s,
              name: location["name"],
              type: location["type"],
              dimension: location["dimension"],
              residents: residents,
              popularity: residents.size
            }
          end
        end.compact
    
        sorted_stops.sort! do |a, b|
          dimension_comparison = a[:dimension].to_s <=> b[:dimension].to_s
    
          if dimension_comparison.zero?
            popularity_comparison = a[:popularity].to_i <=> b[:popularity].to_i
            popularity_comparison.zero? ? a[:name].to_s <=> b[:name].to_s : popularity_comparison
          else
            dimension_comparison
          end
        end
    
        sorted_ids = sorted_stops.map { |stop| stop[:id].to_i }
    
        travel.travel_stops = sorted_ids
      end
    end

    if expand
      expanded_travel_plans = travels.map do |travel|
        expanded_travel_stops = travel.travel_stops.map do |stop|
          url = "http://rickandmortyapi.com/api/location/#{stop}"
          response = Crest.get(url)

          if response.status_code == 200
            location_data = JSON.parse(response.body.to_s)
            
            {
              id: location_data["id"],
              name: location_data["name"],
              type: location_data["type"],
              dimension: location_data["dimension"]
            }
          else
            nil
          end
        end.compact

        { id: travel.id, travel_stops: expanded_travel_stops }
      end

      json(expanded_travel_plans, HTTP::Status::OK)
    else
      json(TravelSerializer.for_collection(travels), HTTP::Status::OK)
    end
  end
end
