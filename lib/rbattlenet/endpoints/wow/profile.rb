module RBattlenet
  module Wow
    class Profile < RBattlenet::Endpoints::Base
      SUPPORTED_FIELDS = [:itself, :user, :protected_summary, :mounts_collection, :pets_collection]

      class << self
        def user
          RBattlenet::Wow::Profile::User
        end

        def protected_summary
          RBattlenet::Wow::Profile::ProtectedSummary
        end

        def mounts_collection
          RBattlenet::Wow::Profile::MountsCollection
        end

        def pets_collection
          RBattlenet::Wow::Profile::PetsCollection
        end
      end
    end
  end
end
