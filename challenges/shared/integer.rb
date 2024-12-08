# frozen_string_literal: true

# Integer useful methods
class Integer
  # Concatenates the number with the given one
  # @param [Integer] num the number to concatenate with
  # @return [Integer] the concatenated result
  def concat(num)
    (to_s + num.to_s).to_i
  end
end
