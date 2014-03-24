# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140123153059) do

  create_table "account_activities", force: true do |t|
    t.integer  "account_id"
    t.integer  "device_id"
    t.string   "result"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_activities", ["account_id", "device_id", "result"], name: "index_account_activities_account_device_result"
  add_index "account_activities", ["account_id", "result"], name: "index_account_activities_account_result"
  add_index "account_activities", ["account_id"], name: "index_account_activities_account_id"
  add_index "account_activities", ["device_id", "result"], name: "index_account_activities_device_result"
  add_index "account_activities", ["device_id"], name: "index_account_activites_device_id"

  create_table "account_device_relations", id: false, force: true do |t|
    t.integer "account_id"
    t.integer "device_id"
  end

  create_table "account_device_tests", force: true do |t|
    t.integer  "account_id"
    t.integer  "device_id"
    t.integer  "test_using_port"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_device_tests", ["account_id", "device_id"], name: "index_account_device_tests_account_device"
  add_index "account_device_tests", ["account_id"], name: "index_account_device_tests_account_id"
  add_index "account_device_tests", ["device_id"], name: "index_account_device_tests_device_id"

  create_table "accounts", force: true do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "auth_type"
    t.string   "description"
    t.string   "user_description"
    t.boolean  "discovery"
    t.boolean  "system"
    t.boolean  "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities", force: true do |t|
    t.string   "action"
    t.text     "info"
    t.boolean  "dismissed",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_group_id"
  end

  create_table "activity_contexts", force: true do |t|
    t.string  "role"
    t.string  "context_type"
    t.integer "activity_id"
    t.integer "context_id"
  end

  add_index "activity_contexts", ["context_type", "context_id"], name: "activity_context_context_type_context_id"

  create_table "activity_groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_computers", force: true do |t|
    t.string   "dn",                                    null: false
    t.string   "name"
    t.string   "dnshostname"
    t.boolean  "iscriticalsystemobject"
    t.datetime "lastlogontimestamp"
    t.string   "objectsid"
    t.string   "operatingsystem"
    t.string   "operatingsystemservicepack"
    t.string   "operatingsystemversion"
    t.datetime "whenchanged"
    t.datetime "whencreated"
    t.integer  "device_id",                  limit: 10
    t.string   "description"
  end

  create_table "ad_users", force: true do |t|
    t.string   "dn"
    t.datetime "badpasswordtime"
    t.integer  "badpwdcount",                           default: 0
    t.string   "cn"
    t.string   "co"
    t.string   "company"
    t.string   "department"
    t.string   "description"
    t.string   "displayname"
    t.string   "givenname"
    t.string   "l"
    t.datetime "lastlogontimestamp"
    t.datetime "lockouttime"
    t.string   "mail"
    t.string   "memberof"
    t.string   "objectsid"
    t.string   "physicaldeliveryofficename"
    t.string   "postalcode"
    t.datetime "pwdlastset"
    t.string   "samaccountname"
    t.string   "sn"
    t.string   "st"
    t.string   "streetaddress"
    t.string   "telephonenumber"
    t.string   "useraccountcontrol"
    t.string   "userprincipalname"
    t.datetime "whenchanged"
    t.datetime "whencreated"
    t.integer  "user_id",                    limit: 10
    t.string   "title"
    t.string   "mobile"
    t.string   "manager"
  end

  create_table "agreement_features", force: true do |t|
    t.integer  "agreement_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agreement_features", ["agreement_id", "name"], name: "index_agreement_features_on_agreement_id_and_name", unique: true

  create_table "agreements", force: true do |t|
    t.integer  "vendor_id"
    t.string   "url"
    t.string   "phone"
    t.string   "account"
    t.string   "email"
    t.date     "service_start"
    t.date     "service_end"
    t.float    "cost"
    t.string   "cost_unit"
    t.string   "account_manager"
    t.text     "description"
    t.string   "domain_name"
    t.date     "domain_date_registered"
    t.date     "domain_date_expiry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ping_version"
    t.text     "old_contacts"
    t.string   "agreement_type"
    t.string   "software_license_type"
    t.string   "software_version"
    t.text     "software_license_keys"
    t.text     "software_license_count"
    t.integer  "warning_alert_count",    default: 0
    t.integer  "error_alert_count",      default: 0
    t.integer  "open_ticket_count",      default: 0
    t.string   "type"
    t.string   "account_username"
    t.string   "account_password"
    t.string   "rest_api_key"
    t.string   "rest_secret_key"
    t.boolean  "reseller"
    t.string   "service_name"
    t.integer  "ping"
  end

  add_index "agreements", ["agreement_type"], name: "index_agreements_on_agreement_type"
  add_index "agreements", ["vendor_id"], name: "index_agreements_on_vendor_id"

  create_table "alerts", force: true do |t|
    t.integer  "alerttype_id",                                              null: false
    t.integer  "alertable_id",          limit: 10
    t.string   "title",                 limit: 75
    t.text     "message"
    t.integer  "active",                           default: 1,              null: false
    t.integer  "data_monitor_id",       limit: 10
    t.datetime "created_at"
    t.string   "alertable_type"
    t.string   "type",                             default: "MonitorAlert"
    t.datetime "updated_at"
    t.string   "lookup_key"
    t.string   "lookup_info"
    t.integer  "monitorable_id"
    t.string   "monitorable_type"
    t.string   "feature"
    t.integer  "resolution_difficulty"
    t.string   "error_class"
    t.string   "error_group"
  end

  add_index "alerts", ["alertable_id", "alertable_type", "active"], name: "index_alerts_on_alertable_id_and_alertable_type_and_active"
  add_index "alerts", ["data_monitor_id"], name: "index_alerts_on_data_monitor_id"

  create_table "alerttypes", force: true do |t|
    t.string "description", limit: 50
  end

  create_table "alt_profiles", force: true do |t|
    t.integer "user_id"
    t.string  "email"
  end

  create_table "anti_virus_products", force: true do |t|
    t.integer "computer_id", limit: 10, null: false
    t.string  "name"
    t.string  "vendor"
    t.integer "up_to_date"
    t.string  "version"
  end

  add_index "anti_virus_products", ["computer_id"], name: "index_anti_virus_products_on_computer_id"

  create_table "attachments", force: true do |t|
    t.string   "content_type"
    t.integer  "size"
    t.string   "filename"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "user_id"
    t.text     "content_name"
  end

  add_index "attachments", ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type"

  create_table "auth_access_tokens", force: true do |t|
    t.string   "token"
    t.string   "secret"
    t.integer  "auth_service_provider_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.integer  "expires_at"
  end

  create_table "auth_service_providers", force: true do |t|
    t.string   "vendor"
    t.string   "consumer_key"
    t.string   "consumer_secret"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avg_accounts_p_839aeb99_cd33_48ce_ad9f_62b792de1bd7_1372778440", force: true do |t|
    t.integer  "account_id",          default: 0
    t.string   "account_name",        default: ""
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avg_alert_logs_p_839aeb99_cd33_48ce_ad9f_62b792de1bd7_1372778440", force: true do |t|
    t.integer  "alert_log_id",        default: 0
    t.integer  "alert_type_id",       default: 0
    t.integer  "account_id",          default: 0
    t.integer  "event_severity_id",   default: 0
    t.string   "alert_name",          default: ""
    t.string   "event_name",          default: ""
    t.integer  "device_id",           default: 0
    t.string   "device_name",         default: ""
    t.string   "alert_details",       default: ""
    t.datetime "alert_created_at"
    t.boolean  "acknowledged",        default: false
    t.string   "full_details",        default: ""
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avg_devices_p_839aeb99_cd33_48ce_ad9f_62b792de1bd7_1372778440", force: true do |t|
    t.integer  "device_id",           default: 0
    t.integer  "account_id",          default: 0
    t.string   "device_name",         default: ""
    t.string   "wan_ip",              default: ""
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avg_virus_vaults_p_839aeb99_cd33_48ce_ad9f_62b792de1bd7_1372778440", force: true do |t|
    t.integer  "virus_vault_id",      default: 0
    t.string   "object_name",         default: ""
    t.string   "orig_object_name",    default: ""
    t.integer  "process_id",          default: 0
    t.string   "threat_description",  default: ""
    t.string   "threat_state",        default: ""
    t.datetime "detection_time"
    t.integer  "device_id",           default: 0
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battery_backup_connections", force: true do |t|
    t.integer  "device_id"
    t.integer  "battery_backup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battery_backup_events", force: true do |t|
    t.string   "description"
    t.date     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.integer  "battery_backup_id"
    t.string   "name"
    t.boolean  "alertable",         default: true
    t.datetime "raw_time"
  end

  create_table "battery_backup_versions", force: true do |t|
    t.integer  "battery_backup_id"
    t.integer  "spice_version"
    t.integer  "current_output_load"
    t.integer  "current_capacity_percent"
    t.date     "battery_replacement_date"
    t.datetime "updated_at"
    t.string   "versioned_type"
  end

  add_index "battery_backup_versions", ["battery_backup_id"], name: "index_battery_backup_versions_on_battery_backup_id"

  create_table "battery_backups", force: true do |t|
    t.string   "type"
    t.integer  "device_id"
    t.string   "manufacturer"
    t.string   "model"
    t.integer  "design_capacity_minutes"
    t.integer  "design_capacity_mw"
    t.integer  "current_output_load"
    t.integer  "current_capacity_minutes"
    t.integer  "current_capacity_percent"
    t.integer  "time_on_battery"
    t.integer  "time_to_full_charge"
    t.integer  "expected_runtime_minutes"
    t.string   "battery_status"
    t.boolean  "needs_battery_replacement"
    t.date     "battery_replacement_date"
    t.date     "install_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serial_number"
    t.string   "builtin_events"
    t.integer  "spice_version"
  end

  create_table "bomgar_reports", force: true do |t|
    t.integer  "remote_control_session_id"
    t.string   "lsid"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canonical_names", force: true do |t|
    t.string   "name"
    t.boolean  "licensed",      default: false
    t.boolean  "unwanted",      default: false
    t.boolean  "user_modified", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string  "name"
    t.string  "type"
    t.string  "applies_to"
    t.string  "find_conditions"
    t.string  "condition"
    t.boolean "front_page"
    t.integer "position"
    t.string  "counter_conditions"
    t.string  "icon"
    t.boolean "built_in",           default: false
    t.boolean "live_update",        default: false
  end

  add_index "categories", ["front_page"], name: "index_categories_on_front_page"
  add_index "categories", ["live_update"], name: "index_categories_on_live_update"

  create_table "cloud_layers", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "layer_id",   null: false
    t.string   "location"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_service_descriptions", force: true do |t|
    t.string   "name"
    t.integer  "community_product_id"
    t.string   "url"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_url"
    t.string   "api_url"
    t.integer  "watch_list"
    t.boolean  "user_generated",       default: false
    t.integer  "warning_alert_count",  default: 0
    t.integer  "error_alert_count",    default: 0
    t.integer  "open_ticket_count",    default: 0
  end

  create_table "cloud_service_detection_histories", force: true do |t|
    t.integer  "cloud_service_description_id"
    t.datetime "date"
    t.integer  "detection_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_service_detections", force: true do |t|
    t.integer  "device_id"
    t.integer  "cloud_service_description_id"
    t.datetime "detected_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
  end

  create_table "cloud_service_features", force: true do |t|
    t.integer  "cloud_service_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_service_ignored_devices", force: true do |t|
    t.integer  "cloud_service_description_id"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_service_product_infos", force: true do |t|
    t.string   "icon_url"
    t.string   "product_name"
    t.string   "vendor_name"
    t.string   "community_id"
    t.string   "product_url"
    t.string   "cloud_service_class_name"
    t.string   "cloud_service_category"
    t.string   "feature_description"
    t.text     "required_login_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_service_ranges", force: true do |t|
    t.integer "octet1_min"
    t.integer "octet1_max"
    t.integer "octet2_min"
    t.integer "octet2_max"
    t.integer "octet3_min"
    t.integer "octet3_max"
    t.integer "octet4_min"
    t.integer "octet4_max"
    t.integer "cloud_service_description_id"
    t.integer "upvotes",                      default: 0
    t.integer "downvotes",                    default: 0
    t.integer "detection_count",              default: 0
  end

  create_table "cloud_service_regexes", force: true do |t|
    t.integer  "cloud_service_description_id"
    t.string   "regex"
    t.integer  "detection_count",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cloud_service_versions", force: true do |t|
    t.integer  "cloud_service_id"
    t.integer  "ping_version"
    t.integer  "ping"
    t.string   "versioned_type"
    t.datetime "updated_at"
  end

  add_index "cloud_service_versions", ["cloud_service_id"], name: "index_agreement_versions_on_agreement_id"

  create_table "cloud_services", force: true do |t|
    t.integer  "vendor_id"
    t.string   "url"
    t.string   "phone"
    t.string   "account"
    t.string   "email"
    t.string   "type"
    t.date     "service_start"
    t.date     "service_end"
    t.float    "cost"
    t.string   "cost_unit"
    t.string   "account_manager"
    t.text     "description"
    t.string   "domain_name"
    t.date     "domain_date_registered"
    t.date     "domain_date_expiry"
    t.text     "old_contacts"
    t.string   "software_license_type"
    t.string   "software_version"
    t.text     "software_license_keys"
    t.text     "software_license_count"
    t.integer  "warning_alert_count"
    t.integer  "error_alert_count"
    t.integer  "open_ticket_count"
    t.string   "account_username"
    t.string   "account_password"
    t.string   "rest_api_key"
    t.string   "rest_secret_key"
    t.boolean  "reseller"
    t.string   "service_name"
    t.integer  "ping"
    t.integer  "ping_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cloud_service_product_info_id"
  end

  create_table "column_configs", force: true do |t|
    t.string  "name"
    t.string  "model"
    t.string  "col_type",         default: "string"
    t.string  "options"
    t.string  "label"
    t.boolean "overridden"
    t.boolean "overriding"
    t.boolean "custom"
    t.boolean "hidden"
    t.boolean "editable"
    t.boolean "generated"
    t.string  "select_sql"
    t.string  "join_sql"
    t.boolean "publicly_visible", default: false
    t.string  "group_sql"
    t.string  "category"
    t.text    "description"
  end

  add_index "column_configs", ["model"], name: "index_column_configs_on_model"

  create_table "comments", force: true do |t|
    t.integer  "ticket_id",                               null: false
    t.text     "body",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.boolean  "is_public",               default: true
    t.string   "attachment_location"
    t.string   "attachment_content_type"
    t.string   "attachment_name"
    t.boolean  "is_purchase",             default: false
    t.boolean  "is_labor"
    t.boolean  "is_inventory",            default: false
  end

  add_index "comments", ["ticket_id", "is_public"], name: "index_comments_on_ticket_id_and_is_public"
  add_index "comments", ["ticket_id"], name: "index_comments_on_ticket_id"

  create_table "company", force: true do |t|
    t.string "name",     limit: 20,              null: false
    t.string "phone",    limit: 10, default: ""
    t.string "fax",      limit: 10, default: ""
    t.string "address1", limit: 60, default: ""
    t.string "address2", limit: 60, default: ""
    t.string "city",     limit: 60, default: ""
    t.string "state",    limit: 60, default: ""
    t.string "zipcode",  limit: 5,  default: ""
    t.string "country",  limit: 20, default: ""
    t.string "industry"
  end

  create_table "config_backups", force: true do |t|
    t.string   "name",                       null: false
    t.string   "backing_file",               null: false
    t.datetime "created_on"
    t.integer  "device_id"
    t.string   "device_uid",                 null: false
    t.integer  "number_changes", default: 0, null: false
    t.string   "note"
  end

  add_index "config_backups", ["device_id"], name: "index_config_backups_on_device_id"
  add_index "config_backups", ["device_uid"], name: "index_config_backups_on_device_uid"

  create_table "configuration", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "value",      limit: 50
    t.datetime "updated_at"
  end

  create_table "consumer_tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "type",       limit: 30
    t.string   "token",      limit: 1024
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumer_tokens", ["token"], name: "index_consumer_tokens_on_token", unique: true

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email_or_web"
    t.integer  "contactable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contactable_type", default: "Agreement"
  end

  create_table "custom_ticket_form_fields", force: true do |t|
    t.string  "type"
    t.text    "options"
    t.integer "field_order"
    t.text    "default_value"
    t.integer "custom_ticket_form_id"
  end

  add_index "custom_ticket_form_fields", ["custom_ticket_form_id"], name: "index_custom_ticket_form_fields_on_custom_ticket_form_id"

  create_table "custom_ticket_forms", force: true do |t|
    t.string "name"
  end

  create_table "data_monitors", force: true do |t|
    t.string  "model",       limit: 50
    t.integer "active",      limit: 10, default: 1,     null: false
    t.boolean "notify_user",            default: false
    t.string  "name"
    t.string  "criteria"
    t.string  "qualifier"
    t.integer "category_id"
  end

  add_index "data_monitors", ["category_id"], name: "index_data_monitors_on_category_id"

  create_table "desktop_monitors", force: true do |t|
    t.integer  "computer_id",       limit: 10,  null: false
    t.string   "name",              limit: 50
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "monitor_type",      limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serial_number"
    t.string   "model_name"
    t.string   "manufacturer"
    t.date     "manufacturer_date"
  end

  add_index "desktop_monitors", ["computer_id"], name: "index_desktop_monitors_on_computer_id"

  create_table "device_versions", force: true do |t|
    t.integer  "device_id"
    t.integer  "spice_version"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.string   "versioned_type", limit: 50
    t.datetime "updated_at"
    t.integer  "ip_comparable",             default: 0
  end

  add_index "device_versions", ["device_id"], name: "index_device_versions_on_device_id"

  create_table "devices", force: true do |t|
    t.string   "name",                       limit: 50,                 null: false
    t.string   "type",                       limit: 50
    t.string   "description",                limit: 80
    t.string   "server_name",                limit: 50
    t.string   "domain",                     limit: 50
    t.string   "uuid",                       limit: 50
    t.string   "manufacturer",               limit: 50
    t.string   "model",                      limit: 50
    t.string   "os_serial_number",           limit: 70
    t.string   "windows_product_id",         limit: 50
    t.string   "serial_number",              limit: 75
    t.string   "ip_address",                 limit: 15
    t.string   "mac_address",                limit: 50
    t.string   "operating_system",           limit: 64
    t.string   "version",                    limit: 50
    t.string   "windows_user",               limit: 50
    t.string   "primary_owner_name",         limit: 50
    t.integer  "memory"
    t.string   "management_oid",             limit: 75
    t.string   "up_time",                    limit: 50
    t.datetime "last_boot_up_time",          limit: 30
    t.integer  "service_pack_major_version", limit: 3
    t.integer  "service_pack_minor_version", limit: 3
    t.integer  "number_of_licensed_users",   limit: 3
    t.integer  "number_of_processors",       limit: 3
    t.string   "processor_type",             limit: 50
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "kernel"
    t.integer  "page_count"
    t.datetime "install_date"
    t.string   "device_type"
    t.string   "current_user"
    t.string   "bios_version"
    t.string   "location"
    t.datetime "online_at"
    t.datetime "offline_at"
    t.string   "asset_tag"
    t.boolean  "manually_added",                        default: false
    t.date     "bios_date"
    t.float    "c_purchase_price"
    t.date     "c_purchase_date"
    t.string   "b_name",                     limit: 50
    t.string   "b_location"
    t.string   "b_device_type"
    t.string   "b_asset_tag"
    t.string   "b_manufacturer",             limit: 50
    t.string   "b_model",                    limit: 50
    t.string   "b_primary_owner_name",       limit: 50
    t.string   "b_serial_number",            limit: 75
    t.integer  "warning_alert_count",                   default: 0
    t.integer  "error_alert_count",                     default: 0
    t.integer  "open_ticket_count",                     default: 0
    t.string   "auto_tag"
    t.string   "dn"
    t.string   "user_tag"
    t.string   "exclude_tag"
    t.datetime "last_scan_time"
    t.integer  "spice_version"
    t.integer  "vpro_level",                 limit: 4,  default: 0
    t.datetime "last_backup_time"
    t.integer  "user_id"
    t.boolean  "user_primary",                          default: false
    t.string   "swid"
    t.string   "product_categories"
    t.integer  "domain_role",                           default: -1
    t.string   "b_description",              limit: 80
    t.integer  "site_id"
    t.integer  "reported_by_id"
    t.integer  "ip_comparable",                         default: 0
    t.string   "scan_state"
    t.datetime "last_qrcode_time"
    t.integer  "mdm_service_id"
    t.integer  "product_info_id"
    t.string   "processor_architecture"
    t.string   "os_architecture"
    t.string   "scan_preferences"
    t.string   "raw_model"
    t.string   "raw_manufacturer"
    t.string   "raw_operating_system"
    t.string   "raw_processor_type"
    t.string   "port_scan_results"
    t.boolean  "vm",                                    default: false
  end

  add_index "devices", ["auto_tag"], name: "index_devices_on_tag"
  add_index "devices", ["name"], name: "altered_devices_name_index"
  add_index "devices", ["serial_number"], name: "index_devices_on_serial_number", unique: true
  add_index "devices", ["user_id"], name: "index_devices_on_user_id"

  create_table "discovery_scans", force: true do |t|
    t.string   "target"
    t.string   "source"
    t.boolean  "disabled",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer  "scan_job_id"
  end

  create_table "disk_partitions", force: true do |t|
    t.integer  "computer_id"
    t.string   "name"
    t.string   "physical_disk_name"
    t.string   "partition_type"
    t.integer  "size",               limit: 8
    t.integer  "starting_offset",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "free_space"
  end

  create_table "disk_versions", force: true do |t|
    t.integer  "disk_id"
    t.integer  "spice_version"
    t.integer  "computer_id",   limit: 10
    t.string   "free_space",    limit: 70
    t.string   "size",          limit: 70
    t.datetime "updated_on"
    t.string   "volume_name"
  end

  add_index "disk_versions", ["disk_id"], name: "index_disk_versions_on_disk_id"

  create_table "disks", force: true do |t|
    t.integer  "computer_id",   limit: 10, null: false
    t.string   "name",          limit: 50, null: false
    t.string   "description",   limit: 70, null: false
    t.string   "file_system",   limit: 70, null: false
    t.string   "free_space",    limit: 70, null: false
    t.string   "size",          limit: 70, null: false
    t.datetime "updated_on"
    t.integer  "spice_version"
    t.string   "volume_name"
  end

  add_index "disks", ["computer_id"], name: "index_disks_on_computer_id"

  create_table "dns_maps", force: true do |t|
    t.string  "start"
    t.string  "resolves_to"
    t.string  "reverse"
    t.integer "error"
    t.boolean "confirmed",      default: false
    t.integer "reported_by_id"
  end

  create_table "documents", force: true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropbox_files_p_a4e990a6_c33a_42a9_ba8d_db8ce7a6ce30_1350513079", force: true do |t|
    t.string   "path",                default: ""
    t.string   "size",                default: ""
    t.string   "thumbnail",           default: ""
    t.boolean  "is_dir",              default: false
    t.string   "modified",            default: ""
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropbox_users_p_a4e990a6_c33a_42a9_ba8d_db8ce7a6ce30_1350513079", force: true do |t|
    t.string   "user_name",           default: ""
    t.integer  "max_usage",           default: 0
    t.integer  "shared_usage",        default: 0
    t.integer  "personal_usage",      default: 0
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "computer_id", limit: 10,  null: false
    t.integer  "uid",         limit: 10,  null: false
    t.integer  "record",      limit: 10,  null: false
    t.string   "log",         limit: 15,  null: false
    t.string   "event_type",  limit: 15,  null: false
    t.datetime "event_date",              null: false
    t.string   "source",      limit: 25,  null: false
    t.string   "user",        limit: 25
    t.string   "message",     limit: 512
  end

  add_index "events", ["log", "uid"], name: "index_events_on_log_and_uid"
  add_index "events", ["uid", "computer_id"], name: "index_events_on_uid_and_computer_id"

  create_table "exception_stats", force: true do |t|
    t.string  "trace"
    t.integer "exception_count"
    t.string  "details"
  end

  create_table "exclusions", force: true do |t|
    t.string   "target"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_alert_details", force: true do |t|
    t.integer  "alert_id"
    t.string   "source",             limit: 150
    t.string   "icon",               limit: 300
    t.text     "raw_data"
    t.string   "remote_instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feature_usages", force: true do |t|
    t.integer  "feature_id",                   null: false
    t.integer  "user_id",                      null: false
    t.boolean  "help_viewed",  default: false, null: false
    t.boolean  "video_viewed", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usage"
  end

  add_index "feature_usages", ["user_id"], name: "index_feature_usages_on_user_id"

  create_table "featured_plugin_notifications", force: true do |t|
    t.string   "guid"
    t.datetime "dismissed_at"
    t.text     "feature_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name",                                              null: false
    t.string   "description",                                       null: false
    t.string   "help_url"
    t.string   "video_url"
    t.string   "computation"
    t.string   "triggered_by"
    t.boolean  "user_specific",                     default: false, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "position",               limit: 10
    t.boolean  "compute_when_triggered",            default: false
    t.string   "usage"
    t.boolean  "spice_meter_feature",               default: false
  end

  create_table "firewall_products", force: true do |t|
    t.integer "computer_id", limit: 10, null: false
    t.string  "name"
    t.string  "vendor"
    t.integer "enabled"
    t.string  "version"
  end

  add_index "firewall_products", ["computer_id"], name: "index_firewall_products_on_computer_id"

  create_table "frontend_rules", force: true do |t|
    t.string   "conditional", limit: 2000, default: "true"
    t.string   "action",      limit: 2000, default: ""
    t.string   "data",        limit: 2000
    t.string   "type",        limit: 30
    t.string   "command",     limit: 30
    t.integer  "max_count"
    t.integer  "count",                    default: 0
    t.datetime "last_fired"
    t.datetime "expires"
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  create_table "google_apps_domain_versions", force: true do |t|
    t.integer  "google_apps_domain_id"
    t.integer  "spice_version"
    t.string   "edition"
    t.integer  "num_accounts"
    t.integer  "usage_in_bytes"
    t.integer  "quota_in_mb"
    t.datetime "collected_on"
    t.datetime "updated_at"
  end

  add_index "google_apps_domain_versions", ["google_apps_domain_id"], name: "index_google_apps_domain_versions_on_google_apps_domain_id"

  create_table "google_apps_domains", force: true do |t|
    t.integer  "cloud_service_id"
    t.string   "name"
    t.string   "edition"
    t.integer  "num_accounts"
    t.integer  "usage_in_bytes"
    t.integer  "quota_in_mb"
    t.datetime "collected_on"
    t.integer  "spice_version",    limit: 4, default: 1
  end

  create_table "google_apps_groups", force: true do |t|
    t.integer "google_apps_domain_id"
    t.string  "name"
    t.string  "description"
    t.text    "owners"
    t.text    "members"
    t.string  "long_name"
  end

  create_table "google_apps_mailbox_versions", force: true do |t|
    t.integer  "google_apps_mailbox_id"
    t.integer  "spice_version"
    t.integer  "google_apps_user_id"
    t.integer  "size"
    t.integer  "available_size"
    t.integer  "max_size"
    t.string   "account_id"
    t.string   "status"
    t.string   "primary_account_id"
    t.string   "primary_account_name"
    t.string   "service_tier"
    t.string   "channel"
    t.string   "suspension_reason"
    t.datetime "creation_time"
    t.datetime "last_login_time"
    t.datetime "last_web_mail_time"
    t.datetime "last_pop_time"
    t.datetime "collected_on"
    t.datetime "updated_at"
  end

  add_index "google_apps_mailbox_versions", ["google_apps_mailbox_id"], name: "index_google_apps_mailbox_versions_on_google_apps_mailbox_id"

  create_table "google_apps_mailboxes", force: true do |t|
    t.integer  "google_apps_domain_id"
    t.integer  "google_apps_user_id"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "size"
    t.integer  "available_size"
    t.integer  "max_size"
    t.string   "account_id"
    t.string   "status"
    t.string   "primary_account_id"
    t.string   "primary_account_name"
    t.string   "service_tier"
    t.string   "channel"
    t.string   "suspension_reason"
    t.datetime "creation_time"
    t.datetime "last_login_time"
    t.datetime "last_web_mail_time"
    t.datetime "last_pop_time"
    t.datetime "collected_on"
    t.integer  "warning_alert_count",   default: 0
    t.integer  "error_alert_count",     default: 0
    t.integer  "open_ticket_count",     default: 0
    t.integer  "spice_version"
  end

  create_table "google_apps_users", force: true do |t|
    t.integer  "google_apps_domain_id"
    t.integer  "user_id"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "suspended"
    t.boolean  "ip_whitelisted"
    t.boolean  "is_admin"
    t.boolean  "change_password_at_next_login"
    t.boolean  "agreed_to_terms"
    t.integer  "max_size"
    t.datetime "collected_on"
    t.text     "groups"
    t.text     "nicknames"
  end

  create_table "group_scan_category_relations", id: false, force: true do |t|
    t.integer "group_scan_id"
    t.integer "category_id"
  end

  create_table "group_scan_topic_relations", id: false, force: true do |t|
    t.integer "group_scan_id"
    t.integer "topic_id"
  end

  create_table "group_scans", force: true do |t|
    t.boolean  "disabled",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "started_at"
    t.datetime "finished_at"
  end

  create_table "hotfix_descriptions", force: true do |t|
    t.string "name",        null: false
    t.string "description"
  end

  create_table "hotfix_installation_versions", force: true do |t|
    t.integer  "hotfix_installation_id"
    t.integer  "spice_version"
    t.integer  "computer_id"
    t.integer  "hotfix_id"
    t.datetime "installed_on"
    t.string   "installed_by"
  end

  add_index "hotfix_installation_versions", ["hotfix_installation_id"], name: "index_hotfix_installation_versions_on_hotfix_installation_id"

  create_table "hotfix_installations", force: true do |t|
    t.integer  "computer_id"
    t.integer  "hotfix_id"
    t.datetime "installed_on"
    t.string   "installed_by"
    t.string   "service_pack_in_effect"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "spice_version"
  end

  add_index "hotfix_installations", ["computer_id"], name: "index_hotfix_installations_on_computer_id"
  add_index "hotfix_installations", ["hotfix_id"], name: "index_hotfix_installations_on_hotfix_id"

  create_table "hotfixes", force: true do |t|
    t.string   "name"
    t.integer  "hotfix_installations_count", default: 0
    t.integer  "open_ticket_count",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hotfixes", ["name"], name: "index_hotfixes_on_name"

  create_table "ilo_devices", force: true do |t|
    t.integer  "computer_id"
    t.integer  "ilo_oa_id"
    t.integer  "device_id"
    t.string   "ilo_firmware"
    t.string   "ilo_server_sn"
    t.string   "ilo_server_name"
    t.string   "ilo_management_processor"
    t.integer  "ilo_license",                        default: 0
    t.string   "ilo_license_type"
    t.string   "ilo_fan_status"
    t.string   "ilo_fan_redundancy_status"
    t.string   "ilo_power_supply_status"
    t.string   "ilo_power_supply_redundancy_status"
    t.string   "ilo_temperature_status"
    t.string   "ilo_drive_status"
    t.integer  "ilo_last_power_reading_value"
    t.string   "ilo_last_power_reading_units"
    t.integer  "ilo_avg_power_reading_value"
    t.string   "ilo_avg_power_reading_units"
    t.integer  "ilo_max_power_reading_value"
    t.string   "ilo_max_power_reading_units"
    t.integer  "ilo_min_power_reading_value"
    t.string   "ilo_min_power_reading_units"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ilo_firmware_date"
  end

  create_table "interface_routes", force: true do |t|
    t.integer  "interface_id"
    t.string   "destination"
    t.string   "mask"
    t.string   "next_hop"
    t.string   "route_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interface_routes", ["interface_id"], name: "index_interface_routes_on_interface_id"

  create_table "interface_versions", force: true do |t|
    t.integer  "interface_id",             null: false
    t.integer  "device_id",     limit: 10, null: false
    t.integer  "bps_in"
    t.integer  "bps_out"
    t.integer  "spice_version"
    t.datetime "updated_on"
  end

  add_index "interface_versions", ["interface_id"], name: "index_interface_versions_on_interface_id"

  create_table "interfaces", force: true do |t|
    t.integer  "device_id",     limit: 10,             null: false
    t.string   "name",          limit: 50
    t.string   "ip_address",    limit: 16
    t.string   "mac_address",   limit: 20
    t.string   "mask",          limit: 16
    t.string   "if_type",       limit: 16
    t.string   "admin_status",  limit: 15
    t.string   "op_status",     limit: 15
    t.integer  "bps_in"
    t.integer  "bps_out"
    t.datetime "updated_on"
    t.integer  "spice_version",            default: 1
    t.string   "if_index",      limit: 20
    t.string   "network",       limit: 20
    t.integer  "speed",         limit: 12
  end

  add_index "interfaces", ["device_id"], name: "index_interfaces_on_device_id"

  create_table "inventory_ticket_relations", force: true do |t|
    t.integer "ticket_id"
    t.integer "inventory_item_id"
    t.string  "inventory_item_type"
  end

  add_index "inventory_ticket_relations", ["inventory_item_type", "inventory_item_id"], name: "index_inventory_ticket_relations_on_item_type_and_id"
  add_index "inventory_ticket_relations", ["ticket_id"], name: "index_inventory_ticket_relations_on_ticket_id"

  create_table "joined_ranges", force: true do |t|
    t.string "na", limit: 6
  end

  create_table "license_software_relations", id: false, force: true do |t|
    t.integer "software_id"
    t.integer "software_license_id"
  end

  add_index "license_software_relations", ["software_id", "software_license_id"], name: "index_license_software_relations_uniqueness", unique: true

  create_table "mail_servers", force: true do |t|
    t.string   "type"
    t.string   "address",                             null: false
    t.integer  "port"
    t.string   "domain"
    t.string   "user_name"
    t.string   "password"
    t.boolean  "use_ssl"
    t.string   "authentication"
    t.string   "sender_email_address"
    t.string   "sender_display_name"
    t.boolean  "enabled",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_edges", force: true do |t|
    t.integer  "target_id",    null: false
    t.integer  "source_id",    null: false
    t.string   "label"
    t.integer  "interface_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_hints", force: true do |t|
    t.string   "from_ip",    limit: 20,                null: false
    t.string   "to_ip",      limit: 20,                null: false
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "added",                 default: true
  end

  create_table "map_nodes", force: true do |t|
    t.integer  "node_id",                               null: false
    t.integer  "device_id"
    t.string   "name",       limit: 60
    t.string   "ip",         limit: 20
    t.string   "node_type",  limit: 50
    t.string   "cloud",      limit: 20
    t.boolean  "backbone",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mdm_enrollment_requests", force: true do |t|
    t.integer  "mdm_service_id"
    t.integer  "status"
    t.datetime "requested_at"
    t.string   "requested_by"
    t.string   "domain"
    t.string   "username"
    t.string   "email_address"
    t.string   "platform"
    t.string   "policySet"
    t.string   "registered_device_name"
    t.datetime "registered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "url"
    t.string   "passcode"
    t.string   "qrcode_url"
    t.integer  "remote_id"
    t.boolean  "hide",                   default: false
  end

  create_table "mdm_services", force: true do |t|
    t.datetime "enrolled_at"
    t.string   "company_name"
    t.string   "api_username"
    t.string   "api_password"
    t.string   "billing_id"
    t.string   "admin_username"
    t.string   "admin_email"
    t.string   "partner_name"
    t.string   "platform_id"
    t.string   "app_id"
    t.string   "app_version"
    t.string   "app_access_key"
    t.datetime "last_scan_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_enrollment_status"
    t.integer  "first_enrollment_user_id"
    t.integer  "remote_id"
    t.text     "apple_csr"
    t.text     "apple_certificate"
    t.datetime "apple_cert_expires_at"
    t.text     "private_key"
    t.string   "account_status"
    t.date     "trial_expires_on"
  end

  add_index "mdm_services", ["api_username"], name: "index_mdm_services_on_api_username", unique: true

  create_table "memory_slots", force: true do |t|
    t.integer "computer_id",  limit: 10, null: false
    t.string  "name",                    null: false
    t.string  "status"
    t.string  "memory_type"
    t.string  "speed"
    t.integer "size"
    t.integer "max_capacity"
  end

  add_index "memory_slots", ["computer_id"], name: "index_memory_slots_on_computer_id"

  create_table "microsoft_exchange_counter_versions", force: true do |t|
    t.integer  "microsoft_exchange_counter_id",            null: false
    t.integer  "computer_id",                   limit: 10, null: false
    t.integer  "rpc_requests"
    t.integer  "send_queue_size"
    t.integer  "sent_permin"
    t.integer  "receive_queue_size"
    t.integer  "receive_permin"
    t.integer  "spice_version"
    t.datetime "updated_on"
  end

  create_table "microsoft_exchange_counters", force: true do |t|
    t.integer  "computer_id",        limit: 10,             null: false
    t.integer  "rpc_requests"
    t.integer  "send_queue_size"
    t.integer  "sent_permin"
    t.integer  "receive_queue_size"
    t.integer  "receive_permin"
    t.integer  "spice_version",                 default: 1
    t.datetime "updated_on"
  end

  add_index "microsoft_exchange_counters", ["computer_id"], name: "index_microsoft_exchange_counters_on_computer_id"

  create_table "microsoft_exchange_mailboxes", force: true do |t|
    t.integer "computer_id",  limit: 10,  null: false
    t.string  "display_name", limit: 100
    t.string  "last_logon",   limit: 100
    t.integer "size"
    t.integer "total_items"
    t.string  "storage",      limit: 200
  end

  add_index "microsoft_exchange_mailboxes", ["computer_id"], name: "index_microsoft_exchange_mailboxes_on_computer_id"

  create_table "microsoft_exchanges", force: true do |t|
    t.integer  "computer_id",            limit: 10,  null: false
    t.string   "name",                   limit: 50
    t.string   "version",                limit: 100
    t.string   "fqdn",                   limit: 100
    t.string   "storage",                limit: 100
    t.integer  "is_front_end_server"
    t.datetime "last_modification_time"
    t.datetime "updated_on"
  end

  add_index "microsoft_exchanges", ["computer_id"], name: "index_microsoft_exchanges_on_computer_id"

  create_table "microsoft_sql_servers", force: true do |t|
    t.integer "computer_id", limit: 10, null: false
    t.string  "name"
  end

  create_table "mobile_device_attributes", force: true do |t|
    t.integer  "device_id"
    t.string   "device_type"
    t.string   "device_status"
    t.string   "maas360_managed_status"
    t.string   "custom_asset_number"
    t.string   "imei_esn"
    t.datetime "installed_date"
    t.datetime "last_reported"
    t.string   "maas360_device_id"
    t.string   "ownership"
    t.string   "username"
    t.string   "email_address"
    t.string   "compliance_state"
    t.string   "out_of_compliance_reasons"
    t.string   "rule_set_configured"
    t.string   "total_free_storage_gb"
    t.string   "device_serial_number"
    t.string   "phone_number"
    t.string   "sim"
    t.string   "processor_name"
    t.string   "ram_mb"
    t.string   "firmware_version"
    t.string   "kernel_version"
    t.string   "modem_firmware_version"
    t.datetime "last_sim_change_date"
    t.string   "data_roaming"
    t.string   "international_data_roaming_enabled"
    t.string   "home_carrier"
    t.string   "current_carrier"
    t.string   "mdm_policy"
    t.string   "policy_compliance_state"
    t.string   "device_rooted"
    t.string   "background_data_sync_enabled"
    t.string   "device_passcode_status"
    t.string   "last_reported_roaming_status"
    t.string   "baseband_version"
    t.string   "total_internal_storage_gb"
    t.string   "free_internal_storage_gb"
    t.string   "total_external_storage_gb"
    t.string   "free_external_storage_gb"
    t.string   "application_data_mb"
    t.string   "rules_compliance_status"
    t.datetime "last_mdm_policy_update_date"
    t.string   "last_mdm_policy_update_source"
    t.datetime "last_selective_wipe_applied_date"
    t.string   "selective_wipe"
    t.datetime "last_wipe_applied_date"
    t.string   "device_wiped"
    t.string   "hardware_encryption"
    t.string   "failed_settings"
    t.string   "settings_failed_to_configure"
    t.string   "settings_configured"
    t.string   "app_compliance_state"
    t.string   "gps_present"
    t.string   "camera_present"
    t.string   "apple_serial_number"
    t.string   "iccid"
    t.string   "device_jailbroken"
    t.string   "application_data_gb"
    t.datetime "activation_date"
    t.string   "allow_explicit_music_and_podcasts"
    t.string   "allow_user_of_i_tunes_music_store"
    t.string   "allow_use_of_you_tube"
    t.string   "allow_user_of_safari"
    t.string   "allow_screen_capture"
    t.string   "allow_use_of_camera"
    t.string   "allow_installing_of_applications"
    t.datetime "jailbreak_detection_date"
    t.string   "selective_wipe_issuer"
    t.string   "platform"
    t.string   "bluetooth_enabled"
  end

  add_index "mobile_device_attributes", ["device_id"], name: "index_mobile_device_attributes_on_device_id", unique: true

  create_table "mobile_software", force: true do |t|
    t.string  "appid"
    t.string  "name"
    t.integer "number_of_installs", default: 0
    t.integer "product_info_id"
    t.string  "platform"
  end

  add_index "mobile_software", ["appid", "platform"], name: "index_mobile_software_on_appid_and_platform", unique: true

  create_table "mobile_software_installations", force: true do |t|
    t.integer  "mobile_software_id"
    t.integer  "mobile_device_id"
    t.string   "version"
    t.integer  "file_size"
    t.integer  "data_size"
    t.boolean  "external"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mozy_machines_p_be0c6a62_947c_48c2_af78_9f26e6a3333b_1356972765", force: true do |t|
    t.string   "status",              default: ""
    t.datetime "last_backup"
    t.string   "alias",               default: ""
    t.float    "quota",               default: 0.0
    t.float    "files",               default: 0.0
    t.integer  "user_id",             default: 0
    t.float    "quota_used_bytes",    default: 0.0
    t.integer  "machine_id",          default: 0
    t.integer  "external_id",         default: 0
    t.integer  "warning_alert_count", default: 0
    t.integer  "error_alert_count",   default: 0
    t.integer  "open_ticket_count",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "net_clarity_events", force: true do |t|
    t.integer  "device_id"
    t.integer  "activity_id"
    t.string   "description"
    t.datetime "date_time"
    t.string   "mac_address"
    t.string   "ip_address"
    t.string   "manufacturer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_adapter_versions", force: true do |t|
    t.integer  "network_adapter_id"
    t.integer  "spice_version"
    t.datetime "updated_on"
    t.integer  "bps_in"
    t.integer  "bps_out"
    t.integer  "ip_comparable",      default: 0
  end

  add_index "network_adapter_versions", ["network_adapter_id"], name: "index_network_adapter_versions_on_network_adapter_id"

  create_table "network_adapters", force: true do |t|
    t.string   "name",              limit: 50
    t.string   "description",       limit: 50
    t.string   "ip_address",        limit: 16
    t.string   "gateway",           limit: 16
    t.string   "net_mask",          limit: 16
    t.string   "mac_address",       limit: 20
    t.string   "dns_domain",        limit: 50
    t.string   "dns_servers",       limit: 64
    t.string   "dhcp_enabled",      limit: 10
    t.string   "dhcp_server",       limit: 30
    t.integer  "computer_id",       limit: 10,             null: false
    t.datetime "updated_on"
    t.string   "net_connection_id"
    t.integer  "spice_version"
    t.string   "ip_addresses"
    t.integer  "bps_in"
    t.integer  "bps_out"
    t.integer  "raw_bytes_in"
    t.integer  "raw_bytes_out"
    t.integer  "ip_comparable",                default: 0
  end

  add_index "network_adapters", ["computer_id"], name: "index_network_adapters_on_computer_id"

  create_table "network_maps", force: true do |t|
    t.string   "map_name",                  null: false
    t.string   "custom_root_node",          null: false
    t.string   "custom_transform_object",   null: false
    t.string   "custom_node_data",          null: false
    t.string   "custom_edge_data",          null: false
    t.string   "original_root_node",        null: false
    t.string   "original_transform_object", null: false
    t.string   "original_node_data",        null: false
    t.string   "original_edge_data",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_users", force: true do |t|
    t.string   "name",             limit: 50
    t.integer  "computer_id",      limit: 10, null: false
    t.integer  "number_of_logons", limit: 10
    t.string   "full_name",        limit: 50
    t.string   "user_type",        limit: 50
    t.datetime "last_logon"
  end

  add_index "network_users", ["computer_id"], name: "index_network_users_on_computer_id"

  create_table "notes", force: true do |t|
    t.integer  "user_id",       limit: 10
    t.datetime "created_at"
    t.text     "body"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.datetime "updated_at"
  end

  add_index "notes", ["noteable_id", "noteable_type"], name: "notes_noteable_id_and_noteable_type"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "office365_distribution_groups", force: true do |t|
    t.integer  "office365_organizational_unit_id"
    t.string   "name"
    t.string   "display_name"
    t.string   "group_type"
    t.string   "primary_smtp_address"
    t.text     "members"
    t.datetime "when_created"
    t.datetime "when_changed"
    t.datetime "collected_on"
  end

  create_table "office365_mailbox_versions", force: true do |t|
    t.integer  "office365_mailbox_id"
    t.integer  "spice_version"
    t.boolean  "active_sync_enabled"
    t.boolean  "owa_enabled"
    t.boolean  "pop_enabled"
    t.boolean  "imap_enabled"
    t.boolean  "mapi_enabled"
    t.boolean  "has_active_sync_device_partnership"
    t.boolean  "is_quarantined"
    t.boolean  "junk_mail_config_enabled"
    t.integer  "item_count",                         default: 0
    t.integer  "size",                               default: 0
    t.integer  "max_size",                           default: 0
    t.datetime "collected_on"
    t.datetime "updated_at"
    t.integer  "available_size",                     default: 0
  end

  add_index "office365_mailbox_versions", ["office365_mailbox_id"], name: "index_office365_mailbox_versions_on_office365_mailbox_id"

  create_table "office365_mailboxes", force: true do |t|
    t.integer  "office365_organizational_unit_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "display_name"
    t.string   "primary_smtp_address"
    t.boolean  "active_sync_enabled"
    t.boolean  "owa_enabled"
    t.boolean  "pop_enabled"
    t.boolean  "imap_enabled"
    t.boolean  "mapi_enabled"
    t.boolean  "has_active_sync_device_partnership"
    t.boolean  "is_quarantined"
    t.boolean  "junk_mail_config_enabled"
    t.integer  "item_count",                         default: 0
    t.integer  "size",                               default: 0
    t.integer  "max_size",                           default: 0
    t.datetime "last_logon"
    t.datetime "last_logoff"
    t.datetime "when_created"
    t.datetime "when_changed"
    t.datetime "collected_on"
    t.integer  "warning_alert_count",                default: 0
    t.integer  "error_alert_count",                  default: 0
    t.integer  "open_ticket_count",                  default: 0
    t.integer  "spice_version"
    t.integer  "available_size",                     default: 0
  end

  create_table "office365_organizational_units", force: true do |t|
    t.integer  "cloud_service_id"
    t.string   "name"
    t.datetime "creation_time"
    t.datetime "collected_on"
  end

  create_table "open_shares", force: true do |t|
    t.string   "name",          limit: 50
    t.string   "resource_type", limit: 50
    t.string   "user_name",     limit: 50
    t.string   "remote_path",   limit: 50
    t.string   "status",        limit: 50
    t.integer  "computer_id",   limit: 10, null: false
    t.datetime "updated_on"
  end

  add_index "open_shares", ["computer_id"], name: "index_open_shares_on_computer_id"

  create_table "physical_disks", force: true do |t|
    t.integer  "computer_id",        limit: 10,                 null: false
    t.integer  "number",             limit: 10
    t.string   "name",               limit: 50
    t.string   "model",              limit: 70,                 null: false
    t.string   "size",               limit: 70
    t.string   "free_space",         limit: 70
    t.string   "status",             limit: 20
    t.string   "serial",             limit: 70
    t.string   "interface",          limit: 20
    t.string   "manufacturer",       limit: 50
    t.string   "firmware",           limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "failure_prediction", limit: 20
    t.boolean  "is_solid_state",                default: false
    t.string   "bus_info"
  end

  create_table "plugin_migrations", force: true do |t|
    t.string "guid"
    t.string "class_name"
  end

  create_table "plugin_model_instance_relationships", force: true do |t|
    t.integer  "model_one_id"
    t.string   "model_one_type"
    t.integer  "model_two_id"
    t.string   "model_two_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_model_instance_relationships", ["model_one_id"], name: "index_plugin_model_instance_relationships_on_model_one_id"
  add_index "plugin_model_instance_relationships", ["model_one_type"], name: "index_plugin_model_instance_relationships_on_model_one_type"
  add_index "plugin_model_instance_relationships", ["model_two_id"], name: "index_plugin_model_instance_relationships_on_model_two_id"
  add_index "plugin_model_instance_relationships", ["model_two_type"], name: "index_plugin_model_instance_relationships_on_model_two_type"

  create_table "plugin_service_configuration_values", force: true do |t|
    t.integer  "plugin_service_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugin_service_event_subscriptions", force: true do |t|
    t.integer  "publisher_id"
    t.string   "subscription_alias"
    t.integer  "subscriber_id"
    t.string   "event_symbol"
    t.string   "method_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_service_event_subscriptions", ["event_symbol"], name: "index_plugin_service_event_subscriptions_on_event_symbol"
  add_index "plugin_service_event_subscriptions", ["publisher_id"], name: "index_plugin_service_event_subscriptions_on_publisher_id"
  add_index "plugin_service_event_subscriptions", ["subscriber_id"], name: "index_plugin_service_event_subscriptions_on_subscriber_id"

  create_table "plugin_services", force: true do |t|
    t.string   "type"
    t.integer  "plugin_id"
    t.text     "data"
    t.boolean  "loaded"
    t.text     "service_hash"
    t.integer  "parent_service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "plugin_guid"
    t.string   "namespace_key"
  end

  add_index "plugin_services", ["loaded"], name: "index_plugin_services_on_loaded"
  add_index "plugin_services", ["parent_service_id"], name: "index_plugin_services_on_parent_service_id"
  add_index "plugin_services", ["plugin_id"], name: "index_plugin_services_on_plugin_id"
  add_index "plugin_services", ["service_hash"], name: "index_plugin_services_on_service_hash"

  create_table "plugin_trend_points", force: true do |t|
    t.integer  "device_id"
    t.string   "key",        null: false
    t.string   "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_trend_points", ["key"], name: "index_plugin_trend_points_on_key"
  add_index "plugin_trend_points", ["updated_at"], name: "index_plugin_trend_points_on_updated_at"

  create_table "plugins", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "version"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.boolean  "installed"
    t.boolean  "shared"
    t.boolean  "update_available"
    t.boolean  "killed"
    t.integer  "user_id"
    t.integer  "save_count",            default: 0
    t.integer  "shared_at_count",       default: 0
    t.boolean  "purchased",             default: false
    t.string   "tags"
    t.boolean  "is_server_mod"
    t.string   "execution_context"
    t.boolean  "built_in"
    t.string   "minimum_app_version"
    t.string   "maximum_app_version"
    t.boolean  "platform_managed",      default: false
    t.string   "platform_content_type"
  end

  add_index "plugins", ["platform_content_type"], name: "index_plugins_on_platform_content_type"
  add_index "plugins", ["platform_managed"], name: "index_plugins_on_platform_managed"
  add_index "plugins", ["user_id", "enabled"], name: "index_plugins_on_user_id_and_enabled"
  add_index "plugins", ["user_id"], name: "index_plugins_on_user_id"

  create_table "port_mappings", force: true do |t|
    t.integer "device_id",    null: false
    t.integer "interface_id"
    t.string  "vlan"
  end

  create_table "printer_supplies", force: true do |t|
    t.integer  "network_printer_id",     limit: 10, null: false
    t.string   "name",                              null: false
    t.string   "color"
    t.integer  "max_level",                         null: false
    t.integer  "current_level",                     null: false
    t.integer  "level",                             null: false
    t.integer  "type_id",                           null: false
    t.integer  "spice_version"
    t.integer  "average_cartridge_life"
    t.datetime "projected_empty_date"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "printer_supplies", ["network_printer_id"], name: "index_printer_supplies_on_network_printer_id"

  create_table "printer_supply_versions", force: true do |t|
    t.integer  "printer_supply_id"
    t.integer  "spice_version"
    t.integer  "current_level"
    t.integer  "level"
    t.datetime "updated_at"
  end

  add_index "printer_supply_versions", ["printer_supply_id"], name: "index_printer_supply_versions_on_printer_supply_id"

  create_table "printers", force: true do |t|
    t.string   "name",                  limit: 50
    t.integer  "computer_id",           limit: 10, null: false
    t.string   "default",               limit: 50
    t.string   "print_processor",       limit: 50
    t.string   "printer_device",        limit: 50
    t.string   "horizontal_resolution", limit: 50
    t.string   "vertical_resolution",   limit: 50
    t.datetime "updated_on"
  end

  add_index "printers", ["computer_id"], name: "index_printers_on_computer_id"

  create_table "product_info", force: true do |t|
    t.string   "type"
    t.string   "image_url"
    t.string   "model_name"
    t.string   "vendor_name"
    t.integer  "community_product_id"
    t.string   "category"
    t.text     "description"
    t.datetime "collected_at"
    t.float    "avg_rating"
    t.integer  "rating_count"
  end

  create_table "purchase_list_items", force: true do |t|
    t.string   "name",               limit: 200,                           null: false
    t.integer  "user_id",                                                  null: false
    t.boolean  "purchased",                      default: false
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.boolean  "received",                       default: false
    t.datetime "received_at"
    t.datetime "purchased_at"
    t.float    "price",                          default: 0.0
    t.boolean  "approved",                       default: false
    t.datetime "approved_at"
    t.string   "charge_to",                      default: "Kuraas"
    t.integer  "agreement_id"
    t.string   "part_number"
    t.string   "purchase_order"
    t.text     "notes"
    t.integer  "quantity",                       default: 1
    t.string   "shipping_code"
    t.datetime "updated_at"
    t.integer  "purchased_for_id"
    t.string   "purchased_for_type"
    t.string   "category",                       default: "Miscellaneous"
    t.string   "subcategory",                    default: "Uncategorized"
    t.string   "order_number"
    t.integer  "quote_id",                       default: 0
    t.string   "upc",                            default: ""
    t.string   "gid",                            default: ""
    t.string   "research_class",                 default: ""
    t.string   "research_code",                  default: ""
    t.string   "product_image",                  default: ""
    t.string   "purchase_link",                  default: ""
    t.integer  "vendor_id"
  end

  add_index "purchase_list_items", ["agreement_id"], name: "index_purchase_list_items_on_agreement_id"
  add_index "purchase_list_items", ["purchased_for_id", "purchased_for_type"], name: "index_purchase_list_items_on_purchased_for"
  add_index "purchase_list_items", ["ticket_id"], name: "index_purchase_list_items_on_ticket_id"
  add_index "purchase_list_items", ["user_id"], name: "index_purchase_list_items_on_user_id"

  create_table "queued_remote_requests", force: true do |t|
    t.integer  "remote_collector_id"
    t.string   "request_params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rackspace_customers", force: true do |t|
    t.integer "cloud_service_id"
    t.string  "account_number"
    t.string  "name"
    t.string  "ref_number"
  end

  create_table "rackspace_distribution_lists", force: true do |t|
    t.integer "rackspace_domain_id"
    t.string  "name"
    t.string  "description"
    t.text    "email_addresses"
    t.boolean "alias",               default: false
  end

  create_table "rackspace_distribution_lists_rackspace_mailboxes", id: false, force: true do |t|
    t.integer "rackspace_distribution_list_id", null: false
    t.integer "rackspace_mailbox_id",           null: false
  end

  create_table "rackspace_domain_versions", force: true do |t|
    t.integer  "rackspace_domain_id"
    t.integer  "spice_version"
    t.integer  "rsemail_mailboxes",                   limit: 4
    t.integer  "rsemail_max_mailboxes",               limit: 4
    t.integer  "rsemail_mailbox_base_size",           limit: 4
    t.integer  "rsemail_mailbox_extra_storage_size",  limit: 4
    t.integer  "rsemail_total_storage"
    t.integer  "exchange_mailboxes",                  limit: 4
    t.integer  "exchange_max_mailboxes",              limit: 4
    t.integer  "exchange_mailbox_base_size",          limit: 4
    t.integer  "exchange_mailbox_extra_storage_size", limit: 4
    t.integer  "exchange_total_storage"
    t.boolean  "archiving_service_enabled"
    t.boolean  "blackberry_mobile_service_enabled"
    t.integer  "blackberry_used_licenses",            limit: 4
    t.integer  "blackberry_licenses",                 limit: 4
    t.boolean  "activesync_mobile_service_enabled"
    t.integer  "activesync_used_licenses",            limit: 4
    t.integer  "activesync_licenses",                 limit: 4
    t.datetime "collected_on"
    t.datetime "updated_at"
  end

  add_index "rackspace_domain_versions", ["rackspace_domain_id"], name: "index_rackspace_domain_versions_on_rackspace_domain_id"

  create_table "rackspace_domains", force: true do |t|
    t.integer  "rackspace_customer_id"
    t.string   "name"
    t.string   "service_type"
    t.integer  "rsemail_mailboxes",                   limit: 4
    t.integer  "rsemail_max_mailboxes",               limit: 4
    t.integer  "rsemail_mailbox_base_size",           limit: 4
    t.integer  "rsemail_mailbox_extra_storage_size",  limit: 4
    t.integer  "rsemail_total_storage"
    t.integer  "exchange_mailboxes",                  limit: 4
    t.integer  "exchange_max_mailboxes",              limit: 4
    t.integer  "exchange_mailbox_base_size",          limit: 4
    t.integer  "exchange_mailbox_extra_storage_size", limit: 4
    t.integer  "exchange_total_storage"
    t.boolean  "archiving_service_enabled"
    t.boolean  "blackberry_mobile_service_enabled"
    t.integer  "blackberry_used_licenses",            limit: 4
    t.integer  "blackberry_licenses",                 limit: 4
    t.boolean  "activesync_mobile_service_enabled"
    t.integer  "activesync_used_licenses",            limit: 4
    t.integer  "activesync_licenses",                 limit: 4
    t.datetime "collected_on"
    t.integer  "spice_version",                       limit: 4, default: 1
  end

  create_table "rackspace_mailbox_versions", force: true do |t|
    t.integer  "rackspace_mailbox_id"
    t.integer  "spice_version"
    t.integer  "size"
    t.integer  "available_size"
    t.integer  "max_size"
    t.boolean  "has_activesync",       default: false
    t.boolean  "has_blackberry",       default: false
    t.datetime "collected_on"
    t.datetime "updated_at"
  end

  add_index "rackspace_mailbox_versions", ["rackspace_mailbox_id"], name: "index_rackspace_mailbox_versions_on_rackspace_mailbox_id"

  create_table "rackspace_mailboxes", force: true do |t|
    t.integer  "rackspace_domain_id"
    t.string   "name"
    t.string   "mbox_type"
    t.integer  "size"
    t.integer  "available_size"
    t.integer  "max_size"
    t.boolean  "has_activesync",             default: false
    t.boolean  "has_blackberry",             default: false
    t.datetime "collected_on"
    t.integer  "warning_alert_count",        default: 0
    t.integer  "error_alert_count",          default: 0
    t.integer  "open_ticket_count",          default: 0
    t.integer  "spice_version"
    t.string   "display_name"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "enabled",                    default: true
    t.datetime "last_login"
    t.text     "additional_email_addresses"
    t.string   "company"
    t.string   "department"
    t.string   "title"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "business_number"
    t.string   "mobile_number"
    t.string   "pager_number"
    t.string   "fax_number"
    t.string   "home_number"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_on"
  end

  create_table "range_entries", force: true do |t|
    t.string   "range"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendation_data_sources", force: true do |t|
    t.string   "name",       null: false
    t.string   "type"
    t.decimal  "value"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "md5"
  end

  add_index "recommendation_data_sources", ["name"], name: "index_recommendation_data_sources_on_uuid", unique: true
  add_index "recommendation_data_sources", ["type"], name: "index_recommendation_data_sources_on_type"

  create_table "recommendation_instances", force: true do |t|
    t.integer  "recommendation_id"
    t.integer  "vector_id"
    t.integer  "user_id",           null: false
    t.text     "data"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "md5"
    t.integer  "weights_vector_id"
    t.datetime "dismissed"
  end

  add_index "recommendation_instances", ["md5"], name: "index_recommendation_instances_on_md5"
  add_index "recommendation_instances", ["recommendation_id"], name: "index_recommendation_instances_on_recommendation_id"
  add_index "recommendation_instances", ["type"], name: "index_recommendation_instances_on_type"
  add_index "recommendation_instances", ["user_id"], name: "index_recommendation_instances_on_user_id"

  create_table "recommendation_log", force: true do |t|
    t.integer  "recommendation_instance_id"
    t.string   "action"
    t.integer  "upload_state",               default: 0, null: false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendation_score_sets", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "upload_state", default: 0
    t.string   "type"
  end

  add_index "recommendation_score_sets", ["type"], name: "index_recommendation_score_sets_on_type"
  add_index "recommendation_score_sets", ["user_id", "created_at"], name: "index_recommendation_score_sets_on_user_id_and_created_at"

  create_table "recommendation_scores", force: true do |t|
    t.integer "score_set_id"
    t.integer "recommendation_instance_id"
    t.float   "score"
  end

  add_index "recommendation_scores", ["recommendation_instance_id"], name: "index_recommendation_scores_on_recommendation_instance_id"

  create_table "recommendation_term_names", force: true do |t|
    t.string "term_name"
  end

  add_index "recommendation_term_names", ["term_name"], name: "index_recommendation_term_names_on_term_name", unique: true

  create_table "recommendation_terms", force: true do |t|
    t.integer  "term_name_id", null: false
    t.float    "value"
    t.integer  "vector_id",    null: false
    t.datetime "updated_at"
  end

  add_index "recommendation_terms", ["term_name_id"], name: "index_recommendation_terms_on_term_name_id"
  add_index "recommendation_terms", ["vector_id"], name: "index_recommendation_terms_on_vector_id"

  create_table "recommendation_vectors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "default_value", default: 0.0
  end

  create_table "recommendations", force: true do |t|
    t.integer  "vector_id",                              null: false
    t.string   "name",                                   null: false
    t.string   "type"
    t.boolean  "deployed_from_backend",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data_sources"
    t.text     "code"
    t.integer  "weights_vector_id"
    t.string   "md5"
    t.integer  "expected_dynamic_terms", default: 1
  end

  add_index "recommendations", ["name"], name: "index_recommendations_on_uid", unique: true
  add_index "recommendations", ["type"], name: "index_recommendations_on_type"

  create_table "remote_agent_metrics", force: true do |t|
    t.integer "remote_collectors_id"
    t.integer "handshake_attempts",   default: 0
    t.integer "full_scan_count",      default: 0
    t.integer "diff_scan_count",      default: 0
    t.integer "failed_scan_count",    default: 0
    t.integer "upgrade_count",        default: 0
  end

  create_table "remote_collectors", force: true do |t|
    t.string   "host"
    t.string   "name"
    t.string   "uuid"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.datetime "last_contact"
    t.boolean  "enabled"
    t.string   "private_key",      limit: 2048
    t.string   "public_key",       limit: 2048
    t.boolean  "authorized"
    t.string   "type",             limit: 40
    t.boolean  "reachable"
    t.boolean  "pending_deletion",              default: false
    t.boolean  "scan_queued",                   default: false
    t.boolean  "settings_updated",              default: false
    t.integer  "site_id"
  end

  create_table "remote_control_sessions", force: true do |t|
    t.string   "type"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.string   "remote_session_id"
    t.string   "code"
    t.string   "status"
    t.datetime "scheduled_start"
    t.datetime "actual_start"
    t.float    "duration"
    t.integer  "auth_service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "session_end"
  end

  create_table "report_fields", force: true do |t|
    t.integer  "report_id",                          null: false
    t.string   "field_name",  limit: 80,             null: false
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "field_order",            default: 0
  end

  add_index "report_fields", ["report_id"], name: "index_report_fields_on_report_id"

  create_table "report_filters", force: true do |t|
    t.integer  "report_id",              null: false
    t.string   "key",        limit: 80,  null: false
    t.string   "operator",   limit: 20,  null: false
    t.string   "value",      limit: 100, null: false
    t.datetime "created_on"
    t.datetime "updated_on"
  end

  add_index "report_filters", ["report_id"], name: "index_report_filters_on_report_id"

  create_table "reports", force: true do |t|
    t.integer  "user_id"
    t.string   "name",            limit: 40,                   null: false
    t.string   "and_or",          limit: 3,    default: "and", null: false
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string   "description",     limit: 200
    t.datetime "last_run"
    t.string   "type"
    t.boolean  "public",                       default: true
    t.boolean  "is_widgetable",                default: false
    t.string   "widget_type"
    t.string   "sql",             limit: 1024
    t.integer  "graph_types_id"
    t.integer  "widget_sizes_id"
  end

  create_table "resource_uses", force: true do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "count",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rule_sets", force: true do |t|
    t.integer  "category_id"
    t.string   "and_or"
    t.string   "klass"
    t.boolean  "live_update", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rule_sets", ["category_id"], name: "index_rule_sets_on_category_id"

  create_table "rules", force: true do |t|
    t.string   "type"
    t.integer  "rule_set_id"
    t.string   "attribute"
    t.string   "value"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rules", ["rule_set_id"], name: "index_rules_on_rule_set_id"

  create_table "running_processes", force: true do |t|
    t.integer  "computer_id",  limit: 10, null: false
    t.integer  "pid",                     null: false
    t.string   "name"
    t.string   "command_line"
    t.integer  "memory"
    t.integer  "cpu_percent"
    t.datetime "updated_on"
    t.string   "user",         limit: 32
  end

  create_table "scalextreme_alerts", force: true do |t|
    t.integer "triggerid"
    t.integer "alertid"
    t.string  "description"
    t.string  "description_text"
    t.string  "error"
    t.string  "expression"
    t.integer "flags"
    t.string  "hosts"
    t.string  "lastchange"
    t.integer "priority"
    t.integer "status"
    t.integer "templateid"
    t.integer "alert_type"
    t.string  "url"
    t.string  "alert_value"
    t.string  "value_flags"
    t.string  "comments"
    t.string  "session_id"
  end

  create_table "scan_job_group_scan_relations", id: false, force: true do |t|
    t.integer "scan_job_id"
    t.integer "group_scan_id"
  end

  create_table "scan_jobs", force: true do |t|
    t.string   "state"
    t.integer  "progress",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "finder_pid"
    t.string   "scan_type"
    t.string   "source"
    t.datetime "completed_at"
    t.datetime "started_at"
    t.integer  "remote_collector_id"
  end

  create_table "scan_schedules", force: true do |t|
    t.string  "days"
    t.integer "starting_hour"
    t.integer "rescan_interval"
    t.integer "schedulable_id"
    t.string  "schedulable_type"
  end

  create_table "scan_stats", force: true do |t|
    t.integer  "scan_job_id"
    t.string   "version"
    t.datetime "created_at"
    t.integer  "desktop"
    t.integer  "laptop"
    t.integer  "server"
    t.integer  "fax"
    t.integer  "firewall"
    t.integer  "copier"
    t.integer  "router"
    t.integer  "network_printer"
    t.integer  "unknown"
    t.integer  "switch"
    t.integer  "hub"
    t.integer  "http_device"
    t.integer  "voip_device"
    t.integer  "wireless"
    t.integer  "snmp_device"
    t.integer  "nas"
    t.integer  "ilo"
    t.integer  "ilo_oa"
    t.integer  "tablet"
    t.integer  "smartphone"
    t.integer  "enable_authentication"
    t.integer  "esx_authentication"
    t.integer  "esx_unknown"
    t.integer  "ilo_authentication"
    t.integer  "one_by_one"
    t.integer  "ssh_authentication"
    t.integer  "ssh_fingerprint"
    t.integer  "ssh_firewall"
    t.integer  "telnet_authentication"
    t.integer  "windows_authentication"
    t.integer  "windows_firewall"
    t.integer  "unexpected_error_group"
    t.integer  "other_device_type"
  end

  create_table "scan_tasks", force: true do |t|
    t.integer  "scan_job_id"
    t.integer  "device_id"
    t.boolean  "processed",   default: false
    t.integer  "progress"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_type"
    t.text     "topics"
  end

  add_index "scan_tasks", ["scan_job_id"], name: "index_scan_tasks_on_scan_job_id"

  create_table "scan_topics", force: true do |t|
    t.string "name"
  end

  create_table "schema_info", force: true do |t|
    t.integer "version"
  end

  create_table "server_features", force: true do |t|
    t.integer  "computer_id", limit: 10, null: false
    t.integer  "feature"
    t.integer  "parent"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_installation_versions", force: true do |t|
    t.integer  "service_installation_id"
    t.integer  "spice_version"
    t.integer  "computer_id"
    t.integer  "service_id"
    t.string   "status"
    t.string   "state"
    t.string   "start_mode"
    t.datetime "updated_at"
  end

  add_index "service_installation_versions", ["service_installation_id"], name: "index_service_installation_versions_on_service_installation_id"

  create_table "service_installations", force: true do |t|
    t.integer  "computer_id"
    t.integer  "service_id"
    t.string   "status",        default: "OK"
    t.string   "state"
    t.string   "start_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "spice_version"
  end

  add_index "service_installations", ["computer_id"], name: "index_service_installations_on_computer_id"
  add_index "service_installations", ["service_id"], name: "index_service_installations_on_service_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "service_installations_count", default: 0
    t.integer  "open_ticket_count",           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accept_stop"
    t.boolean  "accept_pause"
  end

  add_index "services", ["name"], name: "index_services_on_name"

  create_table "share_permissions", force: true do |t|
    t.integer "share_id"
    t.string  "account"
    t.boolean "list_permission",         default: false
    t.boolean "add_file_permission",     default: false
    t.boolean "add_subdir_permission",   default: false
    t.boolean "read_ea_permission",      default: false
    t.boolean "write_ea_permission",     default: false
    t.boolean "traverse_permission",     default: false
    t.boolean "delete_child_permission", default: false
    t.boolean "read_attr_permission",    default: false
    t.boolean "write_attr_permission",   default: false
    t.boolean "delete_permission",       default: false
    t.boolean "read_control_permission", default: false
    t.boolean "write_dac_permission",    default: false
    t.boolean "write_owner_permission",  default: false
    t.boolean "synchronize_permission",  default: false
    t.integer "ad_user_id"
    t.string  "permission_type"
  end

  create_table "shares", force: true do |t|
    t.string   "name",          limit: 50
    t.string   "path",          limit: 50
    t.string   "status",        limit: 50
    t.integer  "computer_id",   limit: 10, null: false
    t.datetime "updated_on"
    t.integer  "disk_id"
    t.datetime "last_modified"
    t.string   "caption"
    t.string   "owner"
    t.string   "group"
    t.integer  "share_type"
    t.datetime "created_at"
  end

  add_index "shares", ["computer_id"], name: "index_shares_on_computer_id"

  create_table "site_memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default",  default: false
  end

  create_table "snmp_neighbors", force: true do |t|
    t.integer "device_id",                   null: false
    t.string  "if_index",         limit: 20
    t.string  "neighbor_if_name"
    t.string  "neighbor"
  end

  create_table "software", force: true do |t|
    t.string   "name"
    t.string   "vendor",                       limit: 50
    t.date     "install_date"
    t.string   "url_info_about",               limit: 150
    t.string   "url_update_info",              limit: 150
    t.integer  "licenses"
    t.integer  "software_installations_count",             default: 0
    t.integer  "warning_alert_count",                      default: 0
    t.integer  "error_alert_count",                        default: 0
    t.integer  "open_ticket_count",                        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
    t.string   "swgroup"
    t.string   "summary"
  end

  add_index "software", ["name"], name: "index_software_on_name"

  create_table "software_installation_versions", force: true do |t|
    t.integer  "software_installation_id"
    t.integer  "spice_version"
    t.integer  "software_id"
    t.integer  "computer_id",              limit: 10
    t.string   "version",                  limit: 50
    t.date     "install_date"
    t.datetime "updated_at"
    t.string   "uninstall_string"
    t.boolean  "from_wmi",                            default: false
    t.boolean  "from_linux",                          default: false
  end

  add_index "software_installation_versions", ["software_installation_id"], name: "index_software_installation_versions_on_software_installation_id"

  create_table "software_installations", force: true do |t|
    t.integer  "software_id"
    t.integer  "computer_id"
    t.integer  "software_license_id"
    t.string   "product_id",          limit: 150
    t.string   "identity",            limit: 150
    t.string   "version",             limit: 50,  default: "unknown"
    t.date     "install_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "license_verified",                default: false
    t.string   "license_verified_by"
    t.datetime "license_verified_on"
    t.integer  "spice_version"
    t.string   "uninstall_string"
    t.boolean  "from_wmi",                        default: false
    t.boolean  "from_linux",                      default: false
  end

  add_index "software_installations", ["computer_id"], name: "index_software_installations_on_computer_id"
  add_index "software_installations", ["software_id"], name: "index_software_installations_on_software_id"
  add_index "software_installations", ["software_license_id"], name: "index_software_installations_on_software_license_id"

  create_table "software_licenses", force: true do |t|
    t.string   "type"
    t.string   "key"
    t.integer  "seat_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "software_name_maps", force: true do |t|
    t.integer  "software_id"
    t.integer  "canonical_name_id"
    t.binary   "title_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "software_name_maps", ["canonical_name_id", "software_id"], name: "index_software_name_maps_on_canonical_name_id_and_software_id"

  create_table "spiceworks_versions", force: true do |t|
    t.string   "version",    null: false
    t.datetime "created_at"
  end

  create_table "ticket_involvements", force: true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_involvements", ["ticket_id"], name: "index_ticket_involvements_on_ticket_id"
  add_index "ticket_involvements", ["user_id"], name: "index_ticket_involvements_on_user_id"

  create_table "ticket_work", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.integer  "time_spent"
    t.decimal  "labor",      default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "summary",             limit: 50,                    null: false
    t.string   "status",                                            null: false
    t.text     "description"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "closed_at"
    t.integer  "created_by"
    t.integer  "assigned_to"
    t.datetime "viewed_at"
    t.boolean  "reopened"
    t.boolean  "requires_purchase"
    t.string   "category"
    t.string   "external_id"
    t.string   "email_message_id"
    t.datetime "status_updated_at"
    t.integer  "warning_alert_count",            default: 0
    t.integer  "error_alert_count",              default: 0
    t.boolean  "muted"
    t.integer  "site_id"
    t.integer  "master_ticket_id"
    t.integer  "reported_by_id"
    t.datetime "due_at"
    t.string   "c_virksomhet",                   default: "Kuraas"
  end

  create_table "unitrends", force: true do |t|
    t.string   "status"
    t.string   "level"
    t.string   "notification"
    t.string   "message"
    t.string   "object"
    t.datetime "received"
  end

  create_table "unprobed_devices", force: true do |t|
    t.string   "device_type"
    t.string   "name"
    t.string   "mac_address"
    t.string   "ip_address"
    t.string   "finder_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upgrade_transactions", force: true do |t|
    t.datetime "created_on"
    t.string   "action"
    t.string   "params"
  end

  create_table "url_caches", force: true do |t|
    t.string   "url"
    t.text     "cache"
    t.text     "icon"
    t.datetime "expires_at"
    t.integer  "expires_every"
    t.datetime "updated_at"
  end

  create_table "user_portal_blocks", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "text"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_updated_by_id"
  end

  create_table "user_portal_built_ins", force: true do |t|
    t.string   "name"
    t.string   "symbol"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_portal_built_ins", ["symbol"], name: "index_user_portal_built_ins_on_symbol"

  create_table "user_portal_layouts", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_portal_layouts", ["key"], name: "index_user_portal_layouts_on_key"

  create_table "user_portal_pages", force: true do |t|
    t.string   "name"
    t.integer  "sort"
    t.text     "main_content"
    t.text     "sidebar_content"
    t.text     "preferences"
    t.string   "internal_reference_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_updated_by_id"
  end

  add_index "user_portal_pages", ["internal_reference_name"], name: "index_user_portal_pages_on_internal_reference_name"

  create_table "users", force: true do |t|
    t.string   "password",                              limit: 20,                 null: false
    t.string   "first_name",                            limit: 64
    t.string   "last_name",                             limit: 64
    t.string   "email",                                 limit: 80,                 null: false
    t.integer  "company_id",                            limit: 10
    t.integer  "logon_count",                           limit: 10, default: 0
    t.string   "display_name"
    t.datetime "registered"
    t.string   "role"
    t.string   "auth_token"
    t.boolean  "verified"
    t.boolean  "display_name_set"
    t.string   "home_page"
    t.boolean  "third_party"
    t.text     "options"
    t.boolean  "survey_offers",                                    default: false
    t.boolean  "visible",                                          default: true
    t.integer  "community_unread_message_count"
    t.integer  "community_activity_count"
    t.datetime "community_activity_seen_at"
    t.string   "office_phone"
    t.string   "cell_phone"
    t.string   "title"
    t.string   "location"
    t.date     "start_date"
    t.string   "department"
    t.integer  "supervisor_id"
    t.datetime "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "preference_vector_id"
    t.integer  "notification_preferences",                         default: 0
    t.integer  "community_preferences_cache_vector_id"
    t.decimal  "billing_rate",                                     default: 275.0, null: false
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "phone"
    t.string   "street_line_1"
    t.string   "street_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_number"
    t.string   "primary_contact_name"
    t.string   "primary_contact_email"
  end

  create_table "video_controllers", force: true do |t|
    t.integer  "computer_id",     limit: 10,  null: false
    t.string   "name",            limit: 50
    t.string   "device_name",     limit: 100
    t.string   "drivers",         limit: 100
    t.string   "driver_version",  limit: 100
    t.datetime "driver_date"
    t.string   "video_processor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "video_controllers", ["computer_id"], name: "index_video_controllers_on_computer_id"

  create_table "virtual_machines", force: true do |t|
    t.integer  "vm_host_id",           null: false
    t.integer  "asset_device_id"
    t.string   "name",                 null: false
    t.string   "uuid",                 null: false
    t.integer  "vcpu_count"
    t.integer  "memory"
    t.integer  "hdd_capacity"
    t.string   "mac_addresses"
    t.string   "on_off"
    t.string   "guest_os_hint"
    t.string   "config_file_path"
    t.datetime "config_last_modified"
    t.string   "tools_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "on_time"
    t.datetime "off_time"
    t.string   "guest_ip_addr"
    t.string   "bios_uuid"
  end

  create_table "vlan_ports", force: true do |t|
    t.integer  "device_id",   limit: 10, null: false
    t.string   "name",        limit: 50
    t.string   "vlan",        limit: 50
    t.string   "ip_address",  limit: 16
    t.string   "mac_address", limit: 20
    t.string   "status",      limit: 15
    t.datetime "updated_on"
  end

  add_index "vlan_ports", ["device_id"], name: "index_vlan_ports_on_device_id"

  create_table "vm_hosts", force: true do |t|
    t.integer  "computer_id",  limit: 10, null: false
    t.string   "name",                    null: false
    t.string   "version"
    t.string   "patch"
    t.string   "license_key"
    t.string   "license_kind"
    t.datetime "eval_expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warranties", force: true do |t|
    t.integer  "vendor_id"
    t.string   "description",            default: ""
    t.date     "start_date"
    t.date     "end_date"
    t.float    "price"
    t.string   "provider_name"
    t.integer  "warranty_collection_id"
    t.string   "deliverables"
    t.string   "service_level"
    t.boolean  "is_muted",               default: false
    t.boolean  "is_custom",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warranty_collections", force: true do |t|
    t.integer "device_id",               null: false
    t.date    "last_scan_date"
    t.date    "next_scan_date"
    t.date    "ship_date"
    t.string  "device_product_number"
    t.string  "b_device_product_number"
    t.boolean "is_stat_trapped"
    t.string  "required_params_hash"
  end

  create_table "web_domain_versions", force: true do |t|
    t.integer  "web_domain_id"
    t.integer  "ping_version"
    t.datetime "updated_at"
    t.integer  "ping"
    t.string   "http_status"
  end

  add_index "web_domain_versions", ["web_domain_id"], name: "index_web_domain_versions_on_web_domain_id"

  create_table "web_domains", force: true do |t|
    t.integer  "cloud_service_id"
    t.string   "name"
    t.string   "registrar"
    t.string   "dns_provider"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ping"
    t.string   "http_status"
    t.datetime "ssl_expiry"
    t.boolean  "should_http",      default: true
    t.boolean  "should_ping",      default: false
    t.integer  "ping_version"
  end

  add_index "web_domains", ["cloud_service_id"], name: "index_web_domains_on_agreement_id"
  add_index "web_domains", ["expiration_date"], name: "index_web_domains_on_expiration_date"

  create_table "webroot_entries", force: true do |t|
    t.integer  "device_id"
    t.string   "sku"
    t.string   "software_version"
    t.string   "language"
    t.string   "hostname"
    t.boolean  "id_shield"
    t.boolean  "web_threat_shield"
    t.boolean  "zero_day_shield"
    t.boolean  "realtime_shield"
    t.boolean  "usb_shield"
    t.boolean  "behavior_shield"
    t.boolean  "core_system"
    t.boolean  "offline_shield"
    t.text     "active_threats"
    t.text     "removed_threats"
    t.integer  "expiration_date"
    t.integer  "last_check_in"
    t.integer  "last_scan_duration"
    t.integer  "scan_frequency"
    t.boolean  "scheduled_scans_enabled"
    t.integer  "last_scan_count"
    t.integer  "total_scans"
    t.string   "scheduled_scan_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webservers", force: true do |t|
    t.string   "title",       limit: 50
    t.integer  "device_id",   limit: 10
    t.string   "server_name", limit: 100
    t.string   "name",        limit: 50
    t.integer  "port",        limit: 10,  default: 80
    t.datetime "updated_on"
  end

  add_index "webservers", ["device_id"], name: "index_webservers_on_device_id"

  create_table "widgets", force: true do |t|
    t.string "name"
    t.string "title"
    t.text   "description"
    t.text   "default_settings"
    t.string "icon"
    t.string "type"
    t.string "category"
    t.string "short_title"
  end

end
