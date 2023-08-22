class Api::Update::Index < ApiAction
    put "/travel_plans/:id" do
        travel_id = TravelQuery.new.find(id)
        travel = SaveTravel.update!(travel_id, params)

        json TravelSerializer.new(travel)
    end
end