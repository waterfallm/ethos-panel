# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180220065856) do

  create_table "pdus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rig_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "defunct"
    t.boolean "off"
    t.boolean "allowed"
    t.boolean "overheat"
    t.text "pool_info"
    t.string "proxywallet"
    t.string "pool"
    t.string "miner_version"
    t.float "rx_kbps", limit: 24
    t.float "tx_kbps", limit: 24
    t.string "kernel"
    t.string "boot_mode"
    t.integer "uptime"
    t.string "mac"
    t.string "hostname"
    t.string "rack_loc"
    t.string "ip"
    t.string "manu"
    t.string "mobo"
    t.string "lan_chip"
    t.float "load", limit: 24
    t.integer "ram"
    t.integer "cpu_temp"
    t.string "cpu_name"
    t.integer "rofs"
    t.string "drive_name"
    t.float "freespace", limit: 24
    t.string "temp"
    t.string "version"
    t.integer "miner_secs"
    t.string "adl_error"
    t.string "proxy_problem"
    t.boolean "updating"
    t.string "connected_displays"
    t.string "resolution"
    t.string "gethelp"
    t.string "config_status"
    t.string "send_remote"
    t.integer "autorebooted"
    t.string "status"
    t.string "driver"
    t.string "selected_gpus"
    t.integer "gpus"
    t.string "fanrpm"
    t.string "fanpercent"
    t.string "hash_rate"
    t.string "miner"
    t.string "miner_hashes"
    t.string "dualminer_status"
    t.string "dualminer_coin"
    t.string "dualminer_hashes"
    t.text "models"
    t.string "bioses"
    t.string "default_core"
    t.string "default_mem"
    t.string "vramsize"
    t.string "core"
    t.string "mem"
    t.string "memstates"
    t.text "meminfo"
    t.string "voltage"
    t.string "overheatedgpu"
    t.string "throttled"
    t.string "powertune"
    t.string "crashed_gpus"
    t.string "uuid"
    t.string "default_watts"
    t.string "pool_switches"
    t.string "acceptance"
    t.string "rejected_shares"
    t.string "flags"
    t.string "biosversion"
    t.string "invalid_shares"
    t.string "watts"
    t.string "watt_min"
    t.string "watt_max"
    t.timestamp "created_at"
  end

  create_table "rigs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
