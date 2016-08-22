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
    offset = exclude_end ? 0 : 1

    end_at = if size < 0
      start_at + (step * size) + offset
    else
      start_at + (step * size) - offset
    end

    new(start_at, end_at, step, exclude_end)
  end

  # Create a timeslice from a list of start times
  def self.keys(keys, step, exclude_end = false)
    offset = exclude_end ? 0 : 1

    start_at = keys.min

    end_at = keys.max ? (keys.max + (step * offset) - offset) : nil

    new(start_at, end_at, step, exclude_end)
  end
end
