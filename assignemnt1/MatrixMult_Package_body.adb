package body MatrixMult is

procedure MatrixMult(A, B, C : array) is

 
begin
   for i in 1 .. size loop
     for j in 1 .. size loop
     task Multiply(i, j);
     task body Multiply(i, j) is
     begin
         for k in 1 .. size loop
           C(i, j) := C(i, j) + A(i, k) * B(k, j);
         end loop;
     end;
     end loop;
   end loop;
end MatrixMult;

