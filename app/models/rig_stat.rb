class RigStat < ApplicationRecord

  def self.latest
    where(id: RigStat.select("MAX(id) AS max").group(:mac).collect{|x| x.max}).order(:rack_loc)
  end

  def self.by_rack
    return []
    sorted_racks = {}
    set = RigStat.latest
    racks = set.collect(&:rack).uniq
    set.each do |rig|
      racks.each do |rack|
        if rig.rack == rack
          sorted_racks[rack] ||= []
          sorted_racks[rack] << rig
          break
        end
      end
    end
    sorted_racks.sort

  end

  def last_ping
    (Time.now - created_at).to_i
  end

  def rack
    rack_loc.split("_").first
  end

  def hash=(val)
    self.write_attribute :hash_rate, val
  end

  def temps
    temp.split.map(&:to_i)
  end

  def hashes
    miner_hashes.split.map(&:to_f)
  end
end
