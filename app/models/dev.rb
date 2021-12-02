class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def reveived_one?(item_name)
        self.freebies.include? Freebie.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        f = Freebie.find_by(item_name: freebie)
        d = Dev.find_by(name: dev)
        if f.dev_id == d.id
            f.update({:dev_id => d.id})
        else
            "That Dev does not own that freebie and cannot give it away."
        end
    end

end
