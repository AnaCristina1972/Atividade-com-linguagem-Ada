with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Solucao_G is
   N : Positive;
begin
   Put_Line("--- Solucao G: Encontrar o Maior Elemento do Array ---");
   Put("Digite a quantidade de elementos do array: ");
   Get(N);

   declare
      type Vetor is array(1..N) of Integer;
      V     : Vetor;
      Maior : Integer;
   begin
      Put_Line("Digite os" & N'Img & " elementos:");
      for I in V'Range loop
         Get(V(I));
      end loop;

      Maior := V(V'First); -- Assume que o primeiro é o maior inicialmente
      for I in V'Range loop
         if V(I) > Maior then
            Maior := V(I);
         end if;
      end loop;

      New_Line;
      Put_Line("O maior elemento é: " & Maior'Img);
   end;
end Solucao_G;