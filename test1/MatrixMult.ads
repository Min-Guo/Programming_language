package MatrixMult is
  size : Integer := 2 ;
  type Matrix is
    array (1 .. size, 1 .. size) of Integer;
  procedure MatMult(A, B : in Matrix; C : out Matrix);
end MatrixMult;
