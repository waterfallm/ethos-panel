class EthosProxyController < ApplicationController

  def message
    render plain: "ethOS can suck my dick"
  end

  def forward
    para = {
       hostname: params[:hostname],
       url_style: JSON.parse(params[:url_style]),

       hash: params[:hash]
    }
    RigStat.create! para[:url_style]
    render plain: "yay"
  end
  private

  def useless_old_proxy_crap


    #p para[:url_style].inspect #[:uuid]

    if para[:url_style]["uuid"].present?
      para[:url_style]["uuid"].reverse.gsub("e", "a").gsub("b", "c").gsub("d", "f")
    end

    # todo Logger und oder feld erstellen

    params[:hostname].reverse!
    mac = ( para[:url_style]["mac"][0..5].reverse.reverse.gsub("0", "1").gsub("2", "3").gsub("4", "5")) + params[:hostname]
    para[:url_style]["mac"] = mac


    para[:url_style]["manu"] = "Biostar"
    para[:url_style]["mobo"] = "TB 250/1"
    para[:url_style]["drive_name"] = "Shin SSD  "
    #para[:url_style]["lan_chip"] = "Intel Intelnet"
    #para[:url_style]["pool_info"] = ""
    para[:url_style]["send_remote"] = ""

    para[:url_style]["rack_loc"] = "new" unless para[:url_style]["rack_loc"]


    para[:url_style]["rack_loc"] = "yY_"+ para[:url_style]["rack_loc"]
    para[:url_style]["rack_loc"].gsub! "_", "."
    para[:hash] = "farm11123456"

    if high_ptune?(para)
      #init_reboot!
      p "High Powertune detected. need reboot!"
      Net::SSH.start(request.remote_ip, 'ethos', {password: "live"} ) do |ssh|
        SshExec.ssh_exec!(ssh, 'r')
      end
      p "reboot done"
    end

    if para[:url_style]["miner_hashes"].split.map(&:to_i).include?(0) && para[:url_style]["uptime"].to_i > 300
      p "dead gpu detected"
      #Net::SSH.start(request.remote_ip, 'ethos', {password: "live"} ) do |ssh|
      #  SshExec.ssh_exec!(ssh, 'r')
      #end
    end



    ethos_url = "http://142.44.138.160/get.php?hostname=#{para[:hostname]}&url_style=#{para[:url_style].to_json}&hash=#{para[:hash]}"

    agent = Mechanize.new
    page = agent.get(ethos_url)
    render plain: page.body

    #render plain: url
    # p      url == "http://ethosdistro.com/get.php?hostname=#{para[:hostname]}&url_style=#{para[:url_style].to_json}&hash=#{para[:hash]}"
    # p "=============="
    # render plain: "http://ethosdistro.com/get.php?hostname=#{para[:hostname]}&url_style=#{para[:url_style].to_json}&hash=#{para[:hash]}"
  end

  def high_ptune?(para)
    tune = para[:url_style]["powertune"].split.map(&:to_i)
    (tune.sum.to_f / tune.count.to_f ) > 3.2
    false
  end

end
