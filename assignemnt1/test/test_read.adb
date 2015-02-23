with Ada.Text_IO; use Ada.Text_IO;

procedure Read1 is

type MatrixBuffer1 is 
array (1 .. size * size) of Integer;

begin

	for i in 1 .. size * size loop
		Ada.Integer_Text_IO.get(i);
		MatrixBuffer1(i) := Ada.Integer_Text_TO.get(i);
		i := i + 1;
	end loop;
	
	for i in 0 .. (size -1) loop
		for j in 1 .. size loop
			FirstMatrix(i, j) := MatrixBuffer1(i * size + j);
		end loop;
	end loop; 

end Read1;



procedure Read2 is

type MatrixBuffer2 is 
array (1 .. size * size) of Integer;

begin

	for i in 1 .. size * size loop
		Ada.Integer_Text_IO.get(i);
		MatrixBuffer2(i) := Ada.Integer_Text_TO.get(i);
		i := i + 1;
	end loop;
	
	for i in 0 .. (size -1) loop
		for j in 1 .. size loop
			SecondMatrix(i, j) := MatrixBuffer2(i * size + j);
		end loop;
	end loop; 

end Read1;


procedure Printer is

begin 
	for i in 1 .. size loop
		put(ThridMatrix(1 .. size, i));
	end loop
end Printer;
	


