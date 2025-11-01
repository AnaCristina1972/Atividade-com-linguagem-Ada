with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Solucao_K is
   Linhas, Colunas : Positive;
begin
   Put_Line("--- Solucao K: Matriz Transposta ---");
   Put("Digite o numero de linhas da matriz: "); Get(Linhas);
   Put("Digite o numero de colunas da matriz: "); Get(Colunas);

   declare
      type Matriz is array (1 .. Linhas, 1 .. Colunas) of Integer;
      type Matriz_T is array (1 .. Colunas, 1 .. Linhas) of Integer;
      A            : Matriz;
      A_Transposta : Matriz_T; -- NOME ALTERADO AQUI
   begin
      Put_Line("Digite os elementos da matriz original:");
      for I in A'Range(1) loop 
         for J in A'Range(2) loop 
            Get(A(I,J)); 
         end loop; 
      end loop;

      -- Loop de transposição
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            A_Transposta(J,I) := A(I,J); -- NOME ALTERADO AQUI
         end loop;
      end loop;

      New_Line;
      Put_Line("Matriz Transposta:");
      -- Loop para imprimir a matriz transposta
      for I in A_Transposta'Range(1) loop
         for J in A_Transposta'Range(2) loop 
            Put(Item => A_Transposta(I,J), Width => 5); -- NOME ALTERADO AQUI
         end loop;
         New_Line;
      end loop;
   end;
end Solucao_K;