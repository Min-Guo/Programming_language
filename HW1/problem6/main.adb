with text_io; use text_io;

procedure main is

package int_io is new integer_io(integer);
use int_io;

task one is
	entry oneDone;
end one;
task two is
	entry twoDone;
end two;

task body one is 
begin
accept oneDone do
	null;
end;
	for I in 1 .. 1000 loop
		put(I);
		if I mod 100 = 0 then
			two.twoDone;
			accept oneDone do 
				null;
			end;
		end if;
	end loop;
end one;

task body two is
begin
accept twoDone do 
	null;
end;
	for J in 2001 .. 3000 loop
			put(J);
			if J mod 100 = 0 then
				one.oneDone;
				accept twoDone do
					null;
				end;
			end if;
	end loop;
end two;

begin
one.oneDone;
end main;