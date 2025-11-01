with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Solucao_M is
   N : Positive;
begin
   Put_Line("--- Solucao M: Soma da Diagonal Principal ---");
   Put("Digite a ordem da matriz quadrada (N): ");
   Get(N);
   
   declare
      type Matriz_Q is array(1..N, 1..N) of Integer;
      A : Matriz_Q;
      Soma_Diag : Integer := 0;
   begin
      Put_Line("Digite os elementos da matriz:");
      for I in A'Range(1) loop for J in A'Range(2) loop Get(A(I,J)); end loop; end loop;

      for I in A'Range(1) loop
         Soma_Diag := Soma_Diag + A(I,I);
      end loop;
      
      New_Line;
      Put_Line("A soma da diagonal principal é: " & Soma_Diag'Img);
   end;
end Solucao_M;