class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    #Accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false.
    def received_one?(item_name)
        self.freebies.include? Freebie.find_by(item_name: item_name)
    end

    #Accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; Returns a string notifying the user that the Dev does not own the Freebie if the id and the dev_id to not match.
    def give_away(dev, freebie)
        if freebie.dev_id == self.id
            freebie.update({:dev_id => dev.id})
        else
            "That Dev does not own that freebie and cannot give it away."
        end
    end

end
