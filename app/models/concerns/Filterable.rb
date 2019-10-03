module Filterable
    extend ActiveSupport::Concern
    # usage in controller @items = Item.filter(params.slice(:key1, :key2))
  
    module ClassMethods
        def filter(filtering_params)
            results = self.by_date
            filtering_params.each do |key, value|
                results = results.public_send(key, value) if value.present?
            end
            results
        end
    end
end
