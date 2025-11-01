with Ada.Text_IO; use Ada.Text_IO;
-- Qustão 5: c) Contar vogais
procedure Conta_Vogais is
   Vogais : constant String := "AEIOUaeiou";
   Texto  : String := "Ada é uma linguagem de programação de última "&
   "geração que equipes de desenvolvimento no mundo todo estão usando"&
   "para softwares críticos: desde microkernels e sistemas embarcados"&
   "de pequeno porte e em tempo real até aplicativos corporativos de"&
   "larga escala, e tudo o que há entre esses dois extremos.";
   Cont_Vogais : Integer := 0;
begin
   Put_Line("=====================================");
   Put_Line("          ANALISADOR DE TEXTO");
   Put_Line("=====================================");
   New_Line;

   Put_Line("Texto analisado:");
   Put_Line(Texto);
   New_Line;

   for I in Texto'Range loop
      for V of Vogais loop
         if Texto(I) = V then
            Cont_Vogais := Cont_Vogais + 1;
            exit;
         end if;
      end loop;
   end loop;

   Put_Line("-------------------------------------");
   Put_Line("Total de vogais encontradas: " & Integer'Image(Cont_Vogais));
   Put_Line("=====================================");
end Conta_Vogais;
