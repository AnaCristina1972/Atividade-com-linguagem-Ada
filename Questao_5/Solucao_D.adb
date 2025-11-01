with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

-- Questão 5: d) Lido um string, escrever quantas e quais são as vogais.
procedure Solucao_D is
   Entrada            : String := Get_Line;
   Contador           : Natural := 0;
   Vogais_Encontradas : Unbounded_String := To_Unbounded_String("");
begin
   Put_Line("--- Solucao D: Contar e Listar Vogais ---");
   Put("Digite uma string e pressione Enter: ");

   for I in Entrada'Range loop
      -- Converte o caractere para maiúsculo para simplificar a comparação
      case Character'Val(Character'Pos(Entrada(I)) - 32) is
         when 'A' | 'E' | 'I' | 'O' | 'U' =>
            Contador := Contador + 1;
            Append(Vogais_Encontradas, Entrada(I));
         when others =>
            null;
      end case;
   end loop;

   New_Line;
   Put_Line("Numero de vogais: " & Contador'Img);
   Put_Line("Vogais encontradas: " & To_String(Vogais_Encontradas));
end Solucao_D;