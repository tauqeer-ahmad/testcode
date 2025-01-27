module CombinationHelper
  # Compute nCk (binomial coefficient) with Ruby big integers.
  def comb(n, k)
    return 0 if k < 0 || k > n
    return 1 if k == 0 || k == n

    numerator   = (n.downto(n - k + 1)).reduce(1, :*)
    denominator = (1..k).reduce(1, :*)
    numerator / denominator
  end
end
