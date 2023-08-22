class Api::Create::Index < ApiAction
    post "/travel_plans" do
        travel = SaveTravel.create!(params)

        json TravelSerializer.new(travel)
    end
end

