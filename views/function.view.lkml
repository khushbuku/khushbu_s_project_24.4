view: function {
  derived_table: {
    explore_source: flights {
      column: arr_date {}
      column: id2 {}
      column: total_sale_price {}

      derived_column: previous_day_check {
        sql: lag(total_sale_price,1,0) over(order by arr_date)  ;;
      }
      derived_column: previous_2day_check {
        sql: lag(total_sale_price,2,0) over(order by arr_date)  ;;
      }
      derived_column: previous_3day_check {
        sql: lag(total_sale_price,3,0) over(order by arr_date)  ;;
      }


    }
  }
  dimension: arr_date {
    description: ""
    type: date
  }
  dimension: id2 {
    primary_key: yes
    description: ""
    type: number
  }
  dimension: total_sale_price {
    description: ""
    type: number
  }

  measure: net_cost {
    type: sum
    label: "Anomaly Cost"
    sql: ${total_sale_price} ;;
    value_format: "€#,##0.00"
  }

  dimension: previous_day_check {
    type: number

  }

  measure: previous_day_check_cost {
    label: "Anomaly -1day check"
    type: sum
    # sql: TRUNC(${previous_day_check},2) ;;
    sql: ${previous_day_check} ;;
    value_format: "€#,##0.00"
  }
  dimension: previous_2day_check {
    type: number
    # sql: lag(${net_cost},2) over (partition by ${service__description} order by ${date} ) ;;
  }

  measure: previous_2day_check_cost {
    label: "Anomaly -2day check"
    type: sum
    # sql: TRUNC(${previous_day_check},2) ;;
    sql: ${previous_2day_check} ;;
    value_format: "€#,##0.00"
  }

  dimension: previous_3day_check {
    type: number
    # sql: lag(${net_cost},2) over (partition by ${service__description} order by ${date} ) ;;
  }

  measure: previous_3day_check_cost {
    label: "Anomaly -3day check"
    type: sum
    # sql: TRUNC(${previous_day_check},2) ;;
    sql: ${previous_3day_check} ;;
    value_format: "€#,##0.00"
  }
}
