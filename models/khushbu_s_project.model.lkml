connection: "bq_faa"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: khushbu_s_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: khushbu_s_project_default_datagroup

explore: airports {}

explore: carriers {}

explore: flights {}

explore: function {}
