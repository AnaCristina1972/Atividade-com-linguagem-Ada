with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Solucao_O is
   Linhas, Colunas : Positive;
begin
   Put_Line("--- Solucao O: Percentual de Elementos Nulos na Matriz ---");
   Put("Digite o numero de linhas: "); Get(Linhas);
   Put("Digite o numero de colunas: "); Get(Colunas);

   declare
      type Matriz is array (1 .. Linhas, 1 .. Colunas) of Integer;
      A              : Matriz;
      Contador_Nulos : Natural := 0;
      Percentual     : Float;
   begin
      Put_Line("Digite os elementos da matriz:");
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            Get(A(I,J));
            if A(I,J) = 0 then
               Contador_Nulos := Contador_Nulos + 1;
            end if;
         end loop;
      end loop;

      Percentual := (Float(Contador_Nulos) / Float(Linhas * Colunas)) * 100.0;
      New_Line;
      Put("O percentual de elementos nulos é: ");
      Put(Percentual, Fore=>2, Aft=>2, Exp=>0);
      Put_Line(" %");
   end;
end Solucao_O;