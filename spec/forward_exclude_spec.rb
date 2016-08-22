require "spec_helper"

RSpec.describe "Forward exclude end" do
  let(:defined) { Dancer::Defined.new(30) }

  let(:start_at) { Time.utc(2016, 8, 1, 8, 0, 0) }
  let(:end_at)   { Time.utc(2016, 8, 1, 8, 2, 0) }

  let(:times)  { dancer.each_time.to_a }
  let(:ranges) { dancer.each_range.to_a }

  shared_examples "four minute dancer" do
    it "sets start at" do
      expect(subject.start_at).to eq(start_at)
    end

    it "sets end at" do
      expect(subject.end_at).to eq(end_at)
    end

    it "sets step" do
      expect(dancer.step).to eq(30)
    end

    it "sets exclude end" do
      expect(dancer.exclude_end?).to eq(true)
    end

    it "returns correct times" do
      expect(times[0]).to eq(Time.utc(2016, 8, 1, 8, 0,  0))
      expect(times[1]).to eq(Time.utc(2016, 8, 1, 8, 0, 30))
      expect(times[2]).to eq(Time.utc(2016, 8, 1, 8, 1,  0))
      expect(times[3]).to eq(Time.utc(2016, 8, 1, 8, 1, 30))
    end

    it "returns correct ranges" do
      expect(ranges[0]).to eq(Time.utc(2016, 8, 1, 8, 0,  0)...Time.utc(2016, 8, 1, 8, 0, 30))
      expect(ranges[1]).to eq(Time.utc(2016, 8, 1, 8, 0, 30)...Time.utc(2016, 8, 1, 8, 1,  0))
      expect(ranges[2]).to eq(Time.utc(2016, 8, 1, 8, 1,  0)...Time.utc(2016, 8, 1, 8, 1, 30))
      expect(ranges[3]).to eq(Time.utc(2016, 8, 1, 8, 1, 30)...Time.utc(2016, 8, 1, 8, 2,  0))
    end

    it "returns size" do
      expect(dancer.size).to eq(4)
    end

    it "returns range" do
      expect(dancer.range).to eq(start_at...end_at)
    end

    it "returns duration" do
      expect(dancer.duration).to eq(120)
    end
  end

  describe "#new" do
    subject(:dancer) { defined.new(start_at, end_at, true) }

    it_behaves_like "four minute dancer"
  end

  describe "#range" do
    subject(:dancer) { defined.range(start_at...end_at) }

    it_behaves_like "four minute dancer"
  end

  describe "#extent" do
    subject(:dancer) { defined.extent(start_at, 4, true) }

    it_behaves_like "four minute dancer"
  end
end
