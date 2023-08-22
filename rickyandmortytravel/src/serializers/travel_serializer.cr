class TravelSerializer < BaseSerializer
    def initialize(@travel : Travel)
    end

    def render
        {
            id: @travel.id,
            travel_stops: @travel.travel_stops
        }
    end
end