# Api module
module Api
  # Api object that is composed of common and unique components
  module DefaultBehaviour
    def select(request, id)
      # Selects database object by PARAM
    end

    def create(request)
      # Creates database object by POST
    end

    def delete(request, id)
      # Deletes database object by id
    end

    def update(request, id)
      # Updates database object by id
    end
  end

  # Api object that is composed of different components
  class ApiObject
    # Model for the api object
    class Model
      # Data mapper model...
    end
  end

  # Api for notes page
  class Notes
    include DefaultBehaviour

    class Model
    end
  end
end
