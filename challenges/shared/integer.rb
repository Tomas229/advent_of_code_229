# frozen_string_literal: true

# Métodos útiles para Integer
class Integer
  # Concatena el número con el entregado
  # @param [Integer] num con cual concatenar
  # @return [Integer] la concatenación
  def concat(num)
    (to_s + num.to_s).to_i
  end
end
