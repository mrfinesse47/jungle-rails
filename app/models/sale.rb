class Sale < ActiveRecord::Base
    #a class method
    # this is an AR scope, this makes it easy to make query methods
    def self.active?
        where("sales.starts_on <= ? AND sales.ends_on >= ?",Date.current,Date.current).any?
    end

    #an instance method, so n a given instance of sale we can ask if its finished
    def finished?
        ends_on < Date.current
    end

    def upcomming?
        starts_on > Date.current
    end

    def active?
        !upcomming? && !finished?
    end
end
