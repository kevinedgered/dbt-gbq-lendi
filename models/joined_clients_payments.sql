-- {{
--   config(
--     materialized='view'
--   )
-- }}

with clients as (Select * from edgered-lab.demo_bronze.clients),
    payments as (Select * from edgered-lab.demo_bronze.payments),
    joined_clients_payments as (select c.client_id, c.entity_type, c.entity_year_established, p.payment_amt from clients c left join payments p on c.client_id=p.client_id)
    Select * from joined_clients_payments