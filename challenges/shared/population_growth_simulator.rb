# frozen_string_literal: true

# PopulationGrowthSimulator tracks populations and simulates their growth over time
# based on a set of growth rules provided.
#
# This class uses a frequency hash to represent the population distribution,
# where each key represents a unique population group or state, and the value
# is the count of individuals in that group/state.
class PopulationGrowthSimulator
  # Initializes the simulator with the given population array.
  # Converts the array into a frequency hash representing the population distribution.
  #
  # @param [Array] array An array where each element represents an individual of a specific population group or state.
  def initialize(array)
    @frequency = array.frequency
  end

  # Simulates population growth for a specified {number} of cycles.
  # Growth rules are defined by the block provided when calling this method.
  # @param [Integer] number The number of cycles to simulate.
  # @yield A block defining the growth rules for each population group/state.
  # @yieldparam [Object] element The current group/state being processed.
  # @yieldparam [Integer] quantity The number of individuals in the current group/state.
  # @yieldreturn [Hash] A hash representing the new population distribution for the current group/state.
  #
  # @example Simulating growth for 3 cycles
  #   simulator = PopulationGrowthSimulator.new([1, 1, 2])
  #   simulator.iterate(3) do |state, count|
  #     # Example rule: state 1 produces 2 new states of 2;
  #     # state 2 transforms into 1 new state of 3
  #     case state
  #     when 1 then { 1 => count, 2 => count * 2 }
  #     when 2 then { 3 => count }
  #     else { state => count }
  #     end
  #   end
  def iterate(number)
    number.times do
      new_frequency = {}
      @frequency.each do |element, quantity|
        new_frequency.merge!(yield(element, quantity)) { |_key, val_1, val_2| val_1 + val_2 }
      end
      @frequency = new_frequency
    end
  end

  # Calculates the total population size by summing the counts of all population groups.
  #
  # @return [Integer] The total population size across all groups.
  def total
    @frequency.values.sum
  end
end
