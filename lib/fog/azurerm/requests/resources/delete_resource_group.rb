module Fog
  module Resources
    class AzureRM
      # This class provides the actual implemention for service calls.
      class Real
        def delete_resource_group(name)
          begin
            Fog::Logger.debug "Deleting Resource Group: #{name}."
            promise = @rmc.resource_groups.delete(name)
            promise.value!
            Fog::Logger.debug "Resource Group #{name} deleted successfully."
            true
          rescue  MsRestAzure::AzureOperationError => e
            msg = "Exception deleting Resource Group #{name}. #{e.body['error']['message']}"
            raise msg
          end
        end
      end

      # This class provides the mock implementation for unit tests.
      class Mock
        def delete_resource_group(name)
          Fog::Logger.debug "Resource Group #{name} deleted successfully."
          true
        end
      end
    end
  end
end
