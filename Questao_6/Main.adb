with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Numerics; -- Para usar o valor de Pi
-- Não precisamos de Ada.Tags

procedure Main is
   
   -- Pacote Geometria (Especificação)
   package Geometria is
      
      type Object is abstract tagged null record;
      function Area (Item : in Object) return Float is abstract;
      procedure Imprime_Area (Item : in Object'Class);
      
      type Circulo is new Object with record
         Raio : Float;
      end record;
      overriding function Area (C : in Circulo) return Float;
      
      type Retangulo is new Object with record
         Largura, Altura : Float;
      end record;
      overriding function Area (R : in Retangulo) return Float;
      
   end Geometria;
   
   ---------------------------------------------------------------------
   
   -- Pacote Geometria (Corpo)
   package body Geometria is
      
      overriding function Area (C : in Circulo) return Float is
      begin
         return Ada.Numerics.Pi * (C.Raio ** 2);
      end Area;
      
      overriding function Area (R : in Retangulo) return Float is
      begin
         return R.Largura * R.Altura;
      end Area;
      
      -- AQUI ESTÁ A CORREÇÃO FINAL --
      procedure Imprime_Area (Item : in Object'Class) is
         Nome_Do_Tipo : String(1..9); 
      begin
         
         if Item in Circulo'Class then
            Nome_Do_Tipo := "Circulo  "; -- 9 chars
         elsif Item in Retangulo'Class then
            Nome_Do_Tipo := "Retangulo"; -- 9 chars
         else
            Nome_Do_Tipo := "Objeto   "; -- 9 chars
         end if;
         
         Ada.Text_IO.Put ("A área do " & Nome_Do_Tipo & " é: ");
         Ada.Float_Text_IO.Put (Item => Area(Item), Fore => 1, Aft => 2, Exp => 0);
         Ada.Text_IO.New_Line;
      end Imprime_Area;
      
   end Geometria;
   
   ---------------------------------------------------------------------
   
   use Geometria;
   
   Meu_Circulo   : Circulo   := (Raio => 2.0);
   Meu_Retangulo : Retangulo := (Largura => 2.0, Altura => 10.0);
   
begin -- Início da parte executável do procedimento Main
   
   Ada.Text_IO.Put_Line("--- Testando o procedimento polimórfico ---");
   
   Imprime_Area (Meu_Circulo);
   Imprime_Area (Meu_Retangulo);
   
end Main;