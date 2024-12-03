# frozen_string_literal: true

# Métodos útiles para Array
class Array
  # @return [Hash] Entrega un hash con los elementos del array y la frecuencia que tiene cada uno en el mismo.
  def frequency
    group_by { |a| a }.transform_values(&:size)
  end
end
