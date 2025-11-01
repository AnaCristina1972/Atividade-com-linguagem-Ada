with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Solucao_E is
   N : Positive;
begin
   Put_Line("--- Solucao E: Produto Interno de Vetores ---");
   Put("Digite o tamanho dos vetores: ");
   Get(N);

   declare
      type Vetor is array (1 .. N) of Integer;
      A, B            : Vetor;
      Produto_Interno : Integer := 0;
   begin
      Put_Line("Digite os" & N'Img & " elementos do vetor A:");
      for I in A'Range loop
         Get(A(I));
      end loop;
      Skip_Line;

      Put_Line("Digite os" & N'Img & " elementos do vetor B:");
      for I in B'Range loop
         Get(B(I));
      end loop;
      Skip_Line;

      for I in A'Range loop
         Produto_Interno := Produto_Interno + (A(I) * B(I));
      end loop;

      New_Line;
      Put_Line("O Produto Interno é: " & Produto_Interno'Img);
   end;
end Solucao_E;