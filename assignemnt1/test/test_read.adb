with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Read is

   Input_File    : File_Type;
   Index         : Integer;

begin

   Ada.Text_IO.Open (File => Input_File, Mode => Ada.Text_IO.In_File, Name => "input.txt");
   declare
   Line : String := Ada.Text_IO.Get_Line (Input_File);
   begin
   Put(Line);
   end;
   --Ada.Text_IO.Put (Item => in Num);
   Ada.Text_IO.Close (File => Input_File);

end Test_Read;
