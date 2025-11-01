-- Programa para Questão 13: TDA Retângulo
-- Saída de "É um quadrado" / "Não é um quadrado"

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;

procedure Solucao_13 is

   -----------------------------------------------------------------
   -- ESPECIFICAÇÃO DO TDA RETÂNGULO
   -----------------------------------------------------------------
   package Retangulos is
      type Retangulo is private;

      function Get_Comprimento(R : Retangulo) return Float;
      function Get_Largura(R : Retangulo) return Float;
      procedure Set_Dimensoes(R : in out Retangulo; C, L : Float);
      function Perimetro(R : Retangulo) return Float;
      function Area(R : Retangulo) return Float;
      function Quadrado(R : Retangulo) return Boolean;

   private
      type Retangulo is
         record
            Comprimento : Float := 1.0;
            Largura     : Float := 1.0;
         end record;
   end Retangulos;

   -----------------------------------------------------------------
   -- CORPO (IMPLEMENTAÇÃO) DO TDA RETÂNGULO
   -----------------------------------------------------------------
   package body Retangulos is

      function Get_Comprimento(R : Retangulo) return Float is
      begin
         return R.Comprimento;
      end Get_Comprimento;

      function Get_Largura(R : Retangulo) return Float is
      begin
         return R.Largura;
      end Get_Largura;

      procedure Set_Dimensoes(R : in out Retangulo; C, L : Float) is
      begin
         -- Verifica se C e L são maiores que 0.0 e menores que 20.0
         if C > 0.0 and C < 20.0 and L > 0.0 and L < 20.0 then
            
            -- Garante que o Comprimento seja a maior dimensão
            if C >= L then
               R.Comprimento := C;
               R.Largura     := L;
            else
               R.Comprimento := L;
               R.Largura     := C;
            end if;
         else
            -- Se a validação falhar, lança uma exceção.
            raise Constraint_Error;
         end if;
      end Set_Dimensoes;

      function Perimetro(R : Retangulo) return Float is
      begin
         return 2.0 * (R.Comprimento + R.Largura);
      end Perimetro;

      function Area(R : Retangulo) return Float is
      begin
         return R.Comprimento * R.Largura;
      end Area;

      function Quadrado(R : Retangulo) return Boolean is
      begin
         -- Um quadrado é quando o comprimento e a largura são iguais.
         return R.Comprimento = R.Largura;
      end Quadrado;

   end Retangulos;
   
   -----------------------------------------------------------------
   -- PROGRAMA PRINCIPAL PARA TESTAR O TDA
   -----------------------------------------------------------------
   
   use Retangulos; -- Torna 'Retangulo', 'Set_Dimensoes', etc. visíveis

   -- Procedimento auxiliar para imprimir todos os detalhes
   procedure Imprimir_Detalhes(Nome: String; R: Retangulo) is
   begin
      New_Line;
      Put_Line("--- Detalhes de: " & Nome & " ---");
      Put("Comprimento: "); Put(Get_Comprimento(R), Fore => 1, Aft => 2, Exp => 0); New_Line;
      Put("Largura:     "); Put(Get_Largura(R),     Fore => 1, Aft => 2, Exp => 0); New_Line;
      Put("Perimetro:   "); Put(Perimetro(R),     Fore => 1, Aft => 2, Exp => 0); New_Line;
      Put("Area:        "); Put(Area(R),          Fore => 1, Aft => 2, Exp => 0); New_Line;
      
  
      if Quadrado(R) then
         Put_Line("Resultado: É um quadrado.");
      else
         Put_Line("Resultado: Não é um quadrado.");
      end if;
   end Imprimir_Detalhes;

-- Início do programa de teste
begin
   
   -- Teste 1: Retângulo Default (deve ser um quadrado)
   declare
      R1 : Retangulo; -- Usa os valores default (1.0, 1.0)
   begin
      Imprimir_Detalhes("R1 (Default)", R1);
   end;
   
   -- Teste 2: Retângulo Válido (não deve ser um quadrado)
   declare
      R2 : Retangulo;
   begin
      Set_Dimensoes(R2, 10.0, 10.5); -- TDA armazena 10.0 e 7.5
      Imprimir_Detalhes("R2 (10.0, 10.5)", R2);
   end;
   
   -- Teste 3: Tentativa de valor inválido
   declare
      R3 : Retangulo;
   begin
      New_Line;
      Put_Line("--- Teste 3: Definindo R3 (Invalido: 25.0) ---");
      begin
         Set_Dimensoes(R3, 25.0, 10.0);
         Put_Line("ERRO: O programa deveria ter parado!");
      exception
         when E: Constraint_Error =>
            Put_Line("OK! Excecao 'Constraint_Error' capturada como esperado.");
            Put_Line("Os valores do retangulo nao foram alterados.");
            Imprimir_Detalhes("R3 (Valores default mantidos)", R3);
      end;
   end;

end Solucao_13;