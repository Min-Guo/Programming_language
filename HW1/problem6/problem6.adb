with text_io; use text_io;

procedure main is

package int_io is new integer_io(integer);
use int_io;

task one;
task two is
	entry next;
end two;

task body one is 
begin
	for I in 1 .. 1000 loop
		put(I);
		if I / 100 = 0 then
			two.next;
		else 
			put(I);
		end if;
	end loop;
end one;

task body two is
begin
	for J in 2001 .. 3000 loop
		accept next do
			put(J);
			if J / 100 = 0 then
				null;
			else
				put(J);
			end if;
		end;
	end loop;
end two;

begin
null;
end main;