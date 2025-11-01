with Ada.Text_IO; use Ada.Text_IO;

procedure Solucao_F is
   String_A : String := Get_Line;
   String_B : String := Get_Line;
   Contido  : Boolean := False;
begin
   Put_Line("--- Solucao F: Verificar se String B está contida em A ---");
   Put("Digite a string A (maior) e pressione Enter: ");
   Put("Digite a string B (menor) e pressione Enter: ");
   New_Line;

   if String_B'Length <= String_A'Length and String_B'Length > 0 then
      for I in String_A'First .. (String_A'Last - String_B'Length + 1) loop
         if String_A(I .. I + String_B'Length - 1) = String_B then
            Contido := True;
            exit; -- Sai do loop assim que encontrar
         end if;
      end loop;
   end if;

   if Contido then
      Put_Line("Resultado: A string B ESTA contida na string A.");
   else
      Put_Line("Resultado: A string B NAO ESTA contida na string A.");
   end if;
end Solucao_F;