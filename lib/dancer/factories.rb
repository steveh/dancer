class Dancer
  # Create an unbounded timeslice
  def self.unbounded(step)
    new(nil, nil, step)
  end

  # Create a timeslice from a range
  def self.range(range, step)
    new(range.begin, range.end, step, range.exclude_end?)
  end

  # Create a timeslice from a start time and a number of a points
  def self.extent(start_at, size, step, exclude_end = false)
    end_at = start_at + (step * size) - 1

    new(start_at, end_at, step, exclude_end)
  end

  # Create a timeslice from a list of start times
  def self.keys(keys, step, exclude_end = false)
    start_at = keys.min
    end_at = keys.max ? (keys.max + step - 1) : nil

    new(start_at, end_at, step, exclude_end)
  end
end
