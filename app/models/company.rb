class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    #Takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev.
    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: "#{item_name}", value: value, company_id: self.id, dev_id: dev.id)
    end
    
    #Returns the Company instance with the earliest founding year.
    def self.oldest_company
        Company.find_by founding_year: self.minimum(:founding_year)
    end

end
