# frozen_string_literal: true

module Year2024
  # Solution
  class Day23 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      @count = 0
      @connections.each do |first_pc, first_pc_connections|
        first_pc_connections.each do |second_pc|
          connections = obtain_t_connections(first_pc, second_pc, first_pc_connections)
          @count += connections&.size || 0
        end
      end
      @count
    end

    def part_2
      nil
    end

    def setup_data
      @connections = {}
      data.each do |d|
        connection = d.split('-').sort
        @connections[connection[0]] = (@connections[connection[0]] || []) + [connection[1]]
      end
    end

    def obtain_t_connections(first_pc, second_pc, first_pc_connections)
      both_pc_connections = @connections[second_pc]&.public_send(:&, first_pc_connections)
      unless first_pc.start_with?('t') || second_pc.start_with?('t')
        both_pc_connections&.select! { |pc| pc.start_with? 't' }
      end
      both_pc_connections
    end
  end
end
