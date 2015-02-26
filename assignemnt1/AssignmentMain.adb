with Ada.Text_IO; use Ada.Text_IO;
with MatrixMult; use MatrixMult;

Procedure AssignmentMain is
	package int_io is new integer_io(integer);
  	use int_io;
  	element : Integer;
  	FirstMatrix : Matrix;
  	SecondMatrix : Matrix;
  	ThirdMatrix : Matrix;
  	task Read1 is
  		entry onestart;
  	end Read1;
	task Read2 is
  		entry onedone;
  	end Read2;
  	task Printer is
  		entry maindone;
  	end Printer;


  	
  	task body Read1 is
  	begin
  	accept onestart do
  		for i in 1 .. size loop
			for j in 1 .. size loop
				get(element);
				FirstMatrix(i, j) := element;
			end loop;
		end loop; 
		Read2.onedone;
	end;
	end; 
	
	task body Read2 is
	begin
		accept onedone do
		for i in 1 .. size loop
			for j in 1 .. size loop
				get(element);
				SecondMatrix(i, j) := element;
			end loop;
		end loop; 
		end;
	end;
	
	task body Printer is
	begin
		accept maindone do
		for i in 1 .. size loop
			for j in 1 .. size loop
				put(ThirdMatrix(i, j));
			end loop;
		new_line;
		end loop; 
		end;
	end;
		

begin
	Read1.onestart;
	MatMult(FirstMatrix, SecondMatrix, ThirdMatrix);
	printer.maindone;
end;