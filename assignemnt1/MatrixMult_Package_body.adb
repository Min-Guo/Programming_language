package body MatrixMult is


 task body MatrixMult is 
 begin
    for i in 1 .. size loop
      for j in 1 .. size loop
          for k in 1 .. size loop
            ThirdMatrix(i, j) := ThirdMatrix(i, j) + FisrtMatrix(i, k) * SecondMatrix(k, j);
          end loop;
        end multiply_ij;
      end loop;
    end loop;
 end MatrixMult;



end MatrixMult;
