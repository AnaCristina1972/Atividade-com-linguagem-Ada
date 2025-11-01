with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Solucao_I is
   Linhas, Colunas : Positive;
begin
   Put_Line("--- Solucao I: Média dos Elementos de uma Matriz ---");
   Put("Digite o numero de linhas: "); Get(Linhas);
   Put("Digite o numero de colunas: "); Get(Colunas);

   declare
      type Matriz is array (1 .. Linhas, 1 .. Colunas) of Integer;
      A     : Matriz;
      Soma  : Long_Integer := 0;
      Media : Float;
   begin
      Put_Line("Digite os elementos da matriz:");
      for I in A'Range(1) loop
         for J in A'Range(2) loop
            Get(A(I,J));
            -- AQUI ESTÁ A CORREÇÃO --
            Soma := Soma + Long_Integer(A(I,J));
         end loop;
      end loop;

      Media := Float(Soma) / Float(Linhas * Colunas);
      New_Line;
      Put("A média dos elementos é: ");
      Put(Media, Fore=>2, Aft=>2, Exp=>0);
      New_Line;
   end;
end Solucao_I;