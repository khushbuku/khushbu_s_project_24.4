connection: "bq_faa"

# include all the views
include: "/views/airports.view.lkml"
include: "/views/carriers.view.lkml"
include: "/views/function.view.lkml"
include: "/views/flights.view.lkml"
include: "/views/order_items_dimension.view.lkml"
#include: "//0_vysakh_thelook/views/order_items.view.lkml"
datagroup: khushbu_s_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: khushbu_s_project_default_datagroup

#explore: derived_flights {}

explore: airports {}

explore: carriers {}

explore: flights {}

explore: function {
  join: order_items {
    type: left_outer
    sql_on: ${function.id2}=${order_items.id} ;;
    relationship: many_to_one
}
}
