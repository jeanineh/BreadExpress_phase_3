module Contexts
  module Customers
    # Context for customers
    def create_customers
      @alexe   = FactoryGirl.create(:customer, first_name: "Alex", last_name: "Egan", phone: "412-268-8211", email: "aegan@example.com")
      @melanie = FactoryGirl.create(:customer, first_name: "Melanie", last_name: "Freeman")
      @anthony = FactoryGirl.create(:customer, first_name: "Anthony", last_name: "Corletti", phone: "412-268-2323")
      @ryan    = FactoryGirl.create(:customer, first_name: "Ryan", last_name: "Flood")
      @sherry  = FactoryGirl.create(:customer, first_name: "Sherry", last_name: "Chen", active: false)
    end
    
    def destroy_customers
      @alexe.delete
      @melanie.delete
      @anthony.delete
      @ryan.delete 
      @sherry.delete
    end

  end
end