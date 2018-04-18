class Performer
  def self.execute(target, cache = {1 => 0})
    return cache[target] if cache[target]

    highest_cache_key = cache.keys.max
    cache = fill_cache(highest_cache_key + 1, target + 1, cache)
    steps = cache[target]
    puts "takes #{steps} steps"
    steps
  end

  def self.fill_cache(current, target, cache)
    while current < target do
      current
      cache[current] = find_best(current, cache)
      current = current + 1
    end
    cache
  end

  private

  def self.find_best(current, cache)
    possible_operations = [
      minus_one(current),
      divide_by_two(current),
      divide_by_three(current),
    ]
    best_step = possible_operations.compact.min
    cache[best_step] + 1
  end

  def self.minus_one(current)
    sleep 0.01
    current - 1
  end

  def self.divide_by_two(current)
    sleep 0.01
    current / 2 if current % 2 == 0
  end

  def self.divide_by_three(current)
    sleep 0.01
    current / 3 if current % 3 == 0
  end
end
