require "performer"
require 'yaml'

describe "Performer" do
  def largest
    1_002
  end

  def write_cache(contents, path)
    File.write(path, contents.to_yaml)
  end

  def read_cache(path)
    YAML.load_file(path)
  end

  def populate_cache(target, path)
    cache = Performer.fill_cache(2, target + 1, {1 => 0})
    write_cache(cache, path)
    cache
  end

  before :all do
    file = 'large.yml'
    path = File.join('fixtures', file)
    @cache = File.exist?(path) ? read_cache(path) : populate_cache(largest, path)
  end

  it "returns 0 if already at 1" do
    expect(Performer.execute(1, @cache)).to eq(0)
  end

  it "returns 1 if at 2" do
    expect(Performer.execute(2, @cache)).to eq(1)
  end

  it "choosest fastest route" do
    expect(Performer.execute(3, @cache)).to eq(1)
  end

  it "handles multiple operations" do
    expect(Performer.execute(8, @cache)).to eq(3)
  end

  it "works for large numbers" do
    expect(Performer.execute(largest, @cache)).to eq(13)
  end

  it "uses cached values when possible" do
    expect(Performer.execute(largest + 11, @cache)).to eq(11)
  end
end
