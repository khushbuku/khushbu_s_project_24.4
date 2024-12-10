include: "//0_vysakh_thelook/views/order_items.view.lkml"

view: order_items_dimension {

sql_table_name: order_items ;;
extends: [order_items]

measure: sum_of_inventory_item_id {
  type: sum
  sql:  ${inventory_item_id};;
}
}
