with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_Io; use Ada.Text_Io;
 
procedure split is
   Source_String : String := "Hello How Are You Today";
   Start_Index : Natural := Source_String'First;
   End_Index : Natural := Source_String'First;
  
   --type buffer is 
   --array (Positive range<>) of Ada.Strings.Unbounded.Unbounded_String;
begin
 
   
   while End_Index < Source_String'Last loop
   	 if Source_String(End_Index) /= ' ' then
   	 	End_Index := End_Index + 1;
   	 else
   	 	put(Source_String(Start_Index .. (End_Index -1)));
   	 	New_Line;
   	 	Start_Index := End_Index + 1;
   	 	End_Index := End_Index + 1;
     end if;
   end loop;
end split;