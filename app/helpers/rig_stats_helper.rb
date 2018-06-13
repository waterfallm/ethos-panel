module RigStatsHelper

  def hashrates(rigs)
    hash = {}
    rigs.each do |rig|
      hash[rig.miner] ||= 0
      hash[rig.miner] += rig.hash_rate.to_f
    end

    tbody = content_tag :tbody do
      hash.collect do |miner, hashrate|
        content_tag :tr do
          concat content_tag(:td, miner)
          concat content_tag(:td,hashrate.round(1))
        end
      end.join().html_safe
    end

 content_tag :table, tbody


  end

  def seconds_to_time(s)

    s = s.to_i
    if s <= 120
      v = 'R'
      u = ""
    elsif s <= 7200 #2 hours
      v = s / 60
      u = "m"
    elsif s <= 48*3600 # 2 display_hash
      v = s / 3600
      u = "h"
    else
      v = s / (3600*24)
      u = "d"
    end
    "#{v}#{u}"
  end

end
