{% test test_count(model) %}

--{% set description %} Doesnt have records in {{ model }} {% endset %}
--{% set fail_msg %} 0 {{ result }} found in {{ model }} {% endset %}
--{{ config( description=description, fail_msg=fail_msg) }}

with table_count as (
select count(*) as t_count from {{model}}
)

SELECT *
FROM (
  SELECT
         CASE WHEN t_count = 0 THEN 1 END as result
  FROM table_count
) as subquery
WHERE result IS NOT NULL


{% endtest %}