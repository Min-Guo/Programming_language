with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

package body MatrixMult is

procedure MatMult(A, B : in Matrix; C : out Matrix) is

	task type MultiplyMatrix is
		entry concurrentTask(i, j : integer; A, B : in Matrix; C : out Matrix );
		entry test(i : integer);
	end MultiplyMatrix;

	AllTask : array (1 .. size, 1 .. size) of MultiplyMatrix;
	Test: array(1 .. 100) of MultiplyMatrix;

	task body MultiplyMatrix is
	
	begin 
 		accept concurrentTask(i, j: Integer; A, B : in Matrix; C : out Matrix) do
 			C(i, j):= 0;
 			for k in 1 .. 100 loop
 			--C(i, j) := C(i, j) + A(i, k) * B(k, j);
 			put(i);
 			put(j);
 			put(k);
 			new_line;

 			end loop;
 		end concurrentTask;
 		
 		accept test(i : Integer) do
 			for k in 1 .. 100  loop
 			put(i);
 			new_line;
 			end loop;
 		end test;
	end MultiplyMatrix;
	
begin
--for i in 1 .. size loop
 	--for j in 1 .. size loop
 		--AllTask(i, j).concurrentTask(i, j , A, B, C);
 	--end loop;
--end loop;
for i in 1 .. 100 loop
 	
 	Test(i).test(i);
 	
end loop;
end MatMult;

end MatrixMult;