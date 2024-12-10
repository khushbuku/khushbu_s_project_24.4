
view: derived_flights {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'flights.arr_date'


      SELECT
          (DATE(flights.arr_time )) AS flights_arr_date
      FROM `faa.flights`  AS flights
      GROUP BY
          1
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: flights_arr_date {
    type: date
    datatype: date
    sql: ${TABLE}.flights_arr_date ;;
  }

  set: detail {
    fields: [
      flights_arr_date
    ]
  }
}
