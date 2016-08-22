class Dancer
  Defined = Struct.new(:step) do
    def unbounded
      Dancer.unbounded(step)
    end

    # Create a timeslice from a range
    def range(range)
      Dancer.range(range, step)
    end

    # Create a timeslice from a start time and a number of a points
    def extent(start_at, size, exclude_end = false)
      Dancer.extent(start_at, size, step, exclude_end)
    end

    # Create a timeslice from a list of start times
    def keys(keys, exclude_end = false)
      Dancer.keys(keys, step, exclude_end)
    end

    def new(start_at, end_at, exclude_end = false)
      Dancer.new(start_at, end_at, step, exclude_end)
    end
  end
end
