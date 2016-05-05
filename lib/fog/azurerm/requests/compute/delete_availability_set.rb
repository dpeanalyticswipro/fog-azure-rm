module Fog
  module Compute
    class AzureRM
      # This class provides the actual implemention for service calls.
      class Real
        def delete_availability_set(resource_group, name)
          begin
            Fog::Logger.debug "Deleting Availability Set: #{name}."
            promise = @compute_mgmt_client.availability_sets.delete(resource_group, name)
            result = promise.value!
            Fog::Logger.debug "Availability Set #{name} deleted successfully."
            result
          rescue MsRestAzure::AzureOperationError => e
            msg = "Exception deleting Availability Set #{name} in Resourse Group #{resource_group}. #{e.body['error']['message']}"
            raise msg
          end
        end
      end
      # This class provides the mock implementation for unit tests.
      class Mock
        def delete_availability_set(resource_group, name)
        end
      end
    end
  end
end