package MatrixMult is
  size : integer := N ;
  type FirstMatrix is
    array (1 .. N, 1 .. N) of Integer;
  type SecondMatrix is
    array (1 .. N, 1 .. N) of Integer;
  procedure MatrixMult(FirstMatrix, SecondMatrix : array);
end MatrixMult;
