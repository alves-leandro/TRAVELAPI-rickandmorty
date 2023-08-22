class Api::Delete::Index < ApiAction
    delete "/travel_plans/:id" do
      travel = TravelQuery.new.find(id)
  
      DeleteTravel.delete!(travel)

      head HTTP::Status::NO_CONTENT
    end
  end