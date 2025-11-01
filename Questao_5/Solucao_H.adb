with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Solucao_H is
   N : Positive;
begin
   Put_Line("--- Solucao H: Ordenar Array (Bubble Sort) ---");
   Put("Digite a quantidade de elementos a ordenar: ");
   Get(N);
   
   declare
      type Vetor is array(1..N) of Integer;
      V    : Vetor;
      Temp : Integer;
   begin
      Put_Line("Digite os" & N'Img & " elementos:");
      for I in V'Range loop Get(V(I)); end loop;

      -- Algoritmo Bubble Sort
      for I in V'First .. V'Last - 1 loop
         for J in V'First .. V'Last - I loop
            if V(J) > V(J+1) then
               Temp   := V(J);
               V(J)   := V(J+1);
               V(J+1) := Temp;
            end if;
         end loop;
      end loop;

      New_Line;
      Put("Array ordenado: ");
      for I in V'Range loop
         Put(Integer'Image(V(I)));
      end loop;
      New_Line;
   end;
end Solucao_H;