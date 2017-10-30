module WeaponsInitializerHelper
  def self.included(base)
    class << base
      private
      def weapon_hash(name, tier:)
        name.to_s + tier.to_s
      end

      def calc_offset(base:, offset:, tier:)
        base + offset * (tier - 1)
      end
    end
  end
end
