require "dancer/version"
require "dancer/constants"
require "dancer/factories"
require "dancer/defined"

class Dancer
  # Start can be a Time or an Integer
  # End can be a Time or an Integer
  # Step is an Integer
  def initialize(start_at, end_at, step, exclude_end = false)
    unless step
      fail ArgumentError, "step is required"
    end

    @start_at = start_at
    @end_at = end_at
    @step = step
    @exclude_end = exclude_end

    if start_at && end_at
      if start_at > end_at
        @operator = :-
        @comparator = :>
      else
        @operator = :+
        @comparator = :<
      end
    end
  end

  attr_reader :start_at, :end_at, :step, :operator, :comparator

  def exclude_end?
    @exclude_end
  end

  # Total number of points in the range
  def size
    return unless bounded?

    ((end_at.public_send(operator, offset) - start_at) / step).abs
  end

  alias count size
  alias length size

  # Range of start and end of slice
  def range
    return unless bounded?

    if exclude_end?
      start_at...end_at
    else
      start_at..end_at
    end
  end

  # Enumerator for each start time
  def each_time
    return enum_for(:each_time) unless block_given?
    return self unless bounded?

    current = start_at
    while current.public_send(comparator, end_at)
      yield current
      current = current.public_send(operator, step)
    end
    self
  end

  # Enumerator for each time range
  def each_range
    return enum_for(:each_range) unless block_given?
    return self unless bounded?

    current = start_at
    while current.public_send(comparator, end_at)
      current_end_at = current.public_send(operator, step) - (0.public_send(operator, offset))

      current_range = if exclude_end?
        current...current_end_at
      else
        current..current_end_at
      end

      yield current_range

      current = current.public_send(operator, step)
    end
    self
  end

  # Number of seconds covered by the slice
  def duration
    return unless bounded?

    (end_at - start_at).abs + offset
  end

  alias to_i duration

  def bounded?
    start_at && end_at
  end

  def to_s
    "#{start_at.inspect}#{exclude_end? ? "..." : ".."}#{end_at.inspect} (step: #{step})"
  end

  def inspect
    "#<Dancer #{to_s}>"
  end

  protected

  def offset
    exclude_end? ? 0 : 1
  end
end
