desc 'Populate Direct Children'
task :populate => :environment do
  query = <<- SQL
  CREATE OR REPLACE FUNCTION get_parent_id(task integer)
      RETURNS integer AS
    $BODY$
    DECLARE
        parent INTEGER;
    BEGIN
        parent := (
            SELECT ancestors[array_length(ancestors,1)] FROM (
                SELECT string_to_array(ancestry, '/') AS ancestors FROM tasks WHERE tasks.id = $1
            ) anc_dummy
            );
        RETURN parent;
    END
    $BODY$
    LANGUAGE plpgsql;

    WITH tasks AS (
        SELECT * FROM tasks WHERE deleted_at IS NULL AND ancestry IS NOT NULL
    )
    SELECT tasks.id as task_id, (SELECT * FROM get_parent_id(tasks.id)) as parent_id INTO temp_task_parent FROM tasks;

    UPDATE tasks
    SET direct_children_count=subquery.total_children
    FROM (SELECT parent_id, count(parent_id) AS total_children FROM temp_task_parent GROUP BY parent_id) AS subquery
    WHERE tasks.id=subquery.parent_id;

    drop table temp_task_parent;
  SQL
  ActiveRecord::Base.connection.execute(query)
end
