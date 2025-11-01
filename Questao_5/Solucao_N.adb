with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Solucao_N is
   N : constant Integer := 3;
   type Matriz is array(1..N, 1..N) of Float;
   A, B, Produto : Matriz;
   Eh_Inversa    : Boolean := True;
   Epsilon       : constant Float := 0.01; -- Tolerância para erros de ponto flutuante
begin
   Put_Line("--- Solucao N: Verificar Matriz Inversa (3x3) ---");
   Put_Line("Digite os elementos da matriz A (use . como separador decimal):");
   for I in A'Range(1) loop for J in A'Range(2) loop Get(A(I,J)); end loop; end loop;

   Put_Line("Digite os elementos da matriz B:");
   for I in B'Range(1) loop for J in B'Range(2) loop Get(B(I,J)); end loop; end loop;

   for I in Produto'Range(1) loop
      for J in Produto'Range(2) loop
         Produto(I,J) := 0.0;
         for K in A'Range(2) loop
            Produto(I,J) := Produto(I,J) + A(I,K) * B(K,J);
         end loop;
      end loop;
   end loop;

   for I in Produto'Range(1) loop
      for J in Produto'Range(2) loop
         if I = J then
            if abs(Produto(I,J) - 1.0) > Epsilon then Eh_Inversa := False; exit; end if;
         else
            if abs(Produto(I,J)) > Epsilon then Eh_Inversa := False; exit; end if;
         end if;
      end loop;
      if not Eh_Inversa then exit; end if;
   end loop;

   New_Line;
   if Eh_Inversa then
      Put_Line("Resultado: As matrizes SÃO inversas uma da outra.");
   else
      Put_Line("Resultado: As matrizes NÃO SÃO inversas.");
   end if;
end Solucao_N;