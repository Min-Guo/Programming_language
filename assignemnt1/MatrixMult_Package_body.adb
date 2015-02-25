package body MatrixMult is

procedure MatrixMult(A, B, C : array) is

 
begin
   for i in 1 .. size loop
     for j in 1 .. size loop
     task Multiply_ij;
     task body Multiply_ij is
     begin
         for k in 1 .. size loop
           C(i, j) := C(i, j) + A(i, k) * B(k, j);
         end loop;
     
     end loop;
   end loop;
end MatrixMult;



end MatrixMult;
