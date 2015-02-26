package body MatrixMult is

procedure MatMult(A, B : in Matrix; C : out Matrix) is

	task type MultiplyMatrix is
		entry concurrentTask(i, j : integer; A, B : in Matrix; C : out Matrix );
	end MultiplyMatrix;

	AllTask : array (1 .. size, 1 .. size) of MultiplyMatrix;

	task body MultiplyMatrix is

	begin 
 		accept concurrentTask(i, j: Integer; A, B : in Matrix; C : out Matrix) do
 			for k in 1 .. size loop
 			C(i, j) := C(i, j) + A(i, k) * B(k, j);
 			end loop;
 		end concurrentTask;
	end MultiplyMatrix;
	
begin
for i in 1 .. size loop
 	for j in 1 .. size loop
 		AllTask(i, j).concurrentTask(i, j , A, B, C);
 	end loop;
end loop;
end MatMult;

end MatrixMult;