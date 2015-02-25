package MatrixMult is
  size : Integer := N ;
  type FirstMatrix is
    array (1 .. size, 1 .. size) of Integer;
  type SecondMatrix is
    array (1 .. size, 1 .. size) of Integer;
  type ThirdMatrix is
    array (1 .. size, 1 .. size) of Integer;
  procedure MatrixMult(A, B, C : array);
end MatrixMult;
