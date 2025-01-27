# spec/services/monotonic_counter_spec.rb
require "rails_helper"

RSpec.describe MonotonicCounter do
  let(:counter) { described_class.new }

  it "returns correct results for known small x" do
    # Provided by the problem statement:
    # x => total_inc_dec(x)
    # 0 => 1
    # 1 => 10
    # 2 => 100
    # 3 => 475
    # 4 => 1675
    # 5 => 4954
    # 6 => 12952

    expect(counter.total_inc_dec(0)).to eq 1
    expect(counter.total_inc_dec(1)).to eq 10
    expect(counter.total_inc_dec(2)).to eq 100
    expect(counter.total_inc_dec(3)).to eq 475
    expect(counter.total_inc_dec(4)).to eq 1675
    expect(counter.total_inc_dec(5)).to eq 4954
    expect(counter.total_inc_dec(6)).to eq 12952
  end

  it "returns 1 for x = 0" do
    expect(counter.total_inc_dec(0)).to eq(1)
  end

  it "handles large values of x without error" do
    expect { counter.total_inc_dec(50) }.not_to raise_error
  end
end
