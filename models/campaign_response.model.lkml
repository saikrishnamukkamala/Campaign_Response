connection: "azure_looker"
include: "/views/*.view*"
include: "/models/*.model*"


datagroup: campaign_response_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: campaign_response_default_datagroup


explore: campaign_response_model {}
explore: customer_demographics {}
explore: campaign_history_performance {}
explore: potential_target_customers {}
explore: model {}
