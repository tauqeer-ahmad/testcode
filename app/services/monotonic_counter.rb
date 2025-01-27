# app/services/monotonic_counter.rb
require_relative "../../lib/tasks/combination_helper"

class MonotonicCounter
  include CombinationHelper

  def initialize
    # We'll store computed results to avoid recalculating for each x
    @results = []
  end

  # Returns the total count of numbers < 10^x
  # that are non-decreasing or non-increasing
  def total_inc_dec(x)
    # Base cases
    return 1  if x == 0  # only “0” (0..0)
    return 10 if x == 1  # “0” through “9”

    # If we have computed it already, return it
    return @results[x] if @results[x]

    # Fill up results array up to x in ascending order
    (@results.size..x).each do |n|
      if n == 0
        @results[0] = 1
      elsif n == 1
        @results[1] = 10
      else
        # new_monotonic_count for n-digit numbers:
        # inc(n) = comb(n+9, 9) - comb(n+8, 9)
        inc_count = comb(n + 9, 9) - comb(n + 8, 9)

        # dec(n) = comb(n+9, 9) - 1
        # (subtract the "all zeros" sequence)
        dec_count = comb(n + 9, 9) - 1

        # Overlap: 9 sequences with all the same digit (1..9)
        # -> subtract 9
        new_for_n_digits = inc_count + dec_count - 9

        # Add to the total from (n-1)
        @results[n] = @results[n - 1] + new_for_n_digits
      end
    end

    @results[x]
  end
end
