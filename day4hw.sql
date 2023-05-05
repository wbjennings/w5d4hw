CREATE OR REPLACE PROCEDURE add_actor(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50)
)
AS 
$$
	BEGIN 
		INSERT INTO actor(
			first_name,
			last_name
		) VALUES (
			_first_name,
			_last_name
		);
		COMMIT;
	END;
$$
LANGUAGE plpgsql;

CALL add_actor('Will', 'Jennings');




CREATE OR REPLACE FUNCTION change_actor_ln(
	_actor_id INTEGER,
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	new_last_name VARCHAR(50)
)
RETURNS VARCHAR(50) AS 
$function$
--$$
	BEGIN 
	UPDATE actor 
	SET last_name = new_last_name
	WHERE actor_id = _actor_id;
	RETURN CONCAT(_first_name,' ', new_last_name) AS full_name;
	END;
$function$
--$$
LANGUAGE plpgsql;

SELECT change_actor_ln(2, 'Penelope', 'Guiness', 'Jennings');

--I know these functions are similar to what we did in class but I wanted to get practice writing the syntax and understanding it further. :)