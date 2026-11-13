create or replace procedure user_login(user_name varchar, user_password varchar)
as $$

	declare
	
		was_found boolean;
	
	begin
	
		select count(*) into was_found from	"user" a
		where a.username = user_name and password = crypt(user_password, a.password);
			
		if (was_found = false) then
			insert into session_failed(username, "when")
			values(user_name, now());
			
			commit;
		
			raise exception 'Username and password are incorrect';
		end if;
			
		update "user" set last_login = now()
		where username = user_name;
		
		commit;
			
		raise notice 'User found %', was_found;
	
	end;

$$ language plpgsql;

call user_login('fernando', '123456');

create or replace trigger create_session_trigger 
	after update on "user"
	for each row 
	when (old.last_login is distinct from new.last_login)
	execute function create_session_log();

create or replace function create_session_log()
returns trigger as $$
	
	begin
		
		insert into "session"(user_id, last_login) values(new.id, now());
		
		return new;
		
	end;

$$ language plpgsql;