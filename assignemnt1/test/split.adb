with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_Io; use Ada.Text_Io;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
 
procedure split is
   Source_String : String := "Hello How Are You Today";
   Start_Index : Natural := Source_String'First;
   End_Index : Natural := Source_String'First;
   Index : Integer;
   type Matrix is array(Positive range <>) of Integer;

begin
 
   
   while End_Index < Source_String'Last loop
   	 if Source_String(End_Index) /= ' ' then
   	 	End_Index := End_Index + 1;
   	 else
   	 	--put(Source_String(Start_Index .. (End_Index -1)));
   	 	--buffer := Source_String(Start_Index .. (End_Index -1));
   	 	Matrix(Index) := Integer'Value(Source_String(Start_Index .. (End_Index -1)));
   	 	put(Matrix(Index));
   	 	Index := Index + 1;
   	 	Start_Index := End_Index + 1;
   	 	End_Index := End_Index + 1;
     end if;
   end loop;
   --put(Matrix(1 .. 4));
 --
end split;