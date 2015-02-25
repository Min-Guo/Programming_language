with Ada.Text_IO; use Ada.Text_IO;

Procedure task_read is
	package int_io is new integer_io(integer);
  	use int_io;
  	element : Integer;
  	FirstMatrix : array (1 .. 2, 1 .. 2) of Integer;
  	SecondMatrix : array (1 ..2, 1 .. 2) of Integer;
  	ThirdMatrix: array (1 .. 2, 1 .. 2) of Integer;
  	task Read1;
  	task Read2 is
  		entry onedone;
  	end Read2;
  	task Printer is
  		entry twodone;
  	end Printer;

  	
  	task body Read1 is
  	begin
  		for i in 1 .. 2 loop
			for j in 1 .. 2 loop
				get(element);
				FirstMatrix(i, j) := element;
			end loop;
		end loop; 
		Read2.onedone;
	end; 
	
	task body Read2 is
	begin
		accept onedone;
		for i in 1 .. 2 loop
			for j in 1 .. 2 loop
				get(element);
				SecondMatrix(i, j) := element;
			end loop;
		end loop; 
		Printer.twodone;
	end;
	
	task body Printer is
	begin
		accept twodone;
		for i in 1 .. 2 loop
			for j in 1 .. 2 loop
				ThirdMatrix(i, j) := FirstMatrix(i, j) + SecondMatrix(i, j);
				put(ThirdMatrix(i, j));
			end loop;
		new_line;
		end loop; 
	end;
		

begin
	null;
end;