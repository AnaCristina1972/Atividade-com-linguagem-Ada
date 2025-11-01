with Ada.Text_IO; use Ada.Text_IO;
-- Questão 5: a) Inverter string
procedure Inverte_String is
   S : String := "THIAGO PAULO";
begin
   for I in reverse S'Range loop
      Put(S(I));
   end loop;
end Inverte_String;
