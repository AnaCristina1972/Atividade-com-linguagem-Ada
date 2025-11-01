with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Solucao_J is
   Linhas, Colunas : Positive;
begin
   Put_Line("--- Solucao J: Soma de Matrizes ---");
   Put("Digite o numero de linhas das matrizes: "); Get(Linhas);
   Put("Digite o numero de colunas das matrizes: "); Get(Colunas);

   declare
      type Matriz is array (1 .. Linhas, 1 .. Colunas) of Integer;
      A, B, C : Matriz;
   begin
      Put_Line("Digite os elementos da matriz A:");
      for I in A'Range(1) loop for J in A'Range(2) loop Get(A(I,J)); end loop; end loop;

      Put_Line("Digite os elementos da matriz B:");
      for I in B'Range(1) loop for J in B'Range(2) loop Get(B(I,J)); end loop; end loop;

      for I in C'Range(1) loop
         for J in C'Range(2) loop
            C(I,J) := A(I,J) + B(I,J);
         end loop;
      end loop;

      New_Line;
      Put_Line("Matriz C (soma):");
      for I in C'Range(1) loop
         for J in C'Range(2) loop Put(Item => C(I,J), Width => 5); end loop;
         New_Line;
      end loop;
   end;
end Solucao_J;