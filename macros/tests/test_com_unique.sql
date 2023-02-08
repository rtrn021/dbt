{% macro check_unique_combination(model, column_names) %}

    select
        *
    from {{model}}
    group by {{ column_names }}
    having count(*) > 1


{% endmacro %}