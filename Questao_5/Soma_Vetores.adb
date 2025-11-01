with Ada.Text_IO; use Ada.Text_IO;
-- Questão 5:  b) Soma de vetores A e B 
procedure Soma_Vetores is
   A : array (1 .. 3) of Integer := (1, 2, 3);
   B : array (1 .. 3) of Integer := (4, 5, 6);
   C : array (1 .. 3) of Integer;
begin
   Put_Line("===== SOMA DE VETORES =====");
   Put_Line("");

   Put_Line("Vetor A: (1, 2, 3)");
   Put_Line("Vetor B: (4, 5, 6)");
   Put_Line("");

   Put_Line("Resultado da soma elemento a elemento:");
   for I in A'Range loop
      C(I) := A(I) + B(I);
      Put_Line("  " & Integer'Image(A(I)) & " +"
               & Integer'Image(B(I)) & " ="
               & Integer'Image(C(I)));
   end loop;

   Put_Line("");
   Put_Line("Vetor resultante C: (" &
      Integer'Image(C(1)) & ", " &
      Integer'Image(C(2)) & ", " &
      Integer'Image(C(3)) & " )");

   Put_Line("============================");
end Soma_Vetores;