# frozen_string_literal: true

# Array useful methods
class Array
  # @return [Hash] Returns a hash with the elements of the array and their respective frequency within it.
  def frequency
    group_by { |a| a }.transform_values(&:size)
  end
end
