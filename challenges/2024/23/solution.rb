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
      setup_data_2
      sorted_keys = @connections.keys # .sort_by { |k| @connections[k].size }.reverse
      res = []

      sorted_keys.each do |key|
        # break if @connections[key].size < res.size
        clique = obtain_biggest_clique(key, @connections[key])
        res = clique if clique.size > res.size
      end
      res.sort!
      res.join(',')
    end

    def setup_data
      @connections = {}
      data.each do |d|
        connection = d.split('-').sort
        @connections[connection[0]] = (@connections[connection[0]] || []) + [connection[1]]
      end
    end

    def setup_data_2
      @connections = {}
      data.each do |d|
        connection = d.split('-')
        @connections[connection[0]] ||= [connection[0]]
        @connections[connection[0]] += [connection[1]]
        @connections[connection[1]] ||= [connection[1]]
        @connections[connection[1]] += [connection[0]]
      end
    end

    private

    def obtain_t_connections(first_pc, second_pc, first_pc_connections)
      both_pc_connections = @connections[second_pc]&.public_send(:&, first_pc_connections)
      unless first_pc.start_with?('t') || second_pc.start_with?('t')
        both_pc_connections&.select! { |pc| pc.start_with? 't' }
      end
      both_pc_connections
    end

    def obtain_biggest_clique(first_pc, possible_pcs)
      possible_clique = [first_pc]
      while possible_clique.size != possible_pcs.size
        next_clique = (possible_pcs - possible_clique).map { |p| [p, possible_pcs & @connections[p]] }

        new_member = next_clique.sort_by { |p| p[1].size }.uniq.reverse.first
        possible_clique += [new_member[0]]
        possible_pcs = new_member[1]
      end
      possible_clique
    end
  end
end
