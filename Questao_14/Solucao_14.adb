-- Programa para Questão 14: TDA Racional
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;

procedure Solucao_14 is

   -----------------------------------------------------------------
   -- ESPECIFICAÇÃO DO TDA RACIONAL
   -----------------------------------------------------------------
   package Racional_TDA is
      
      type Racional is private;
      
      -- Função "Construtor":
      -- 1. Fornece valores default (0, 1) se nenhum for dado.
      -- 2. Garante o formato reduzido e o sinal correto.
      function Criar(N : Integer := 0; D : Integer := 1) return Racional;

      -- Funções de "get" (úteis para as operações)
      function Get_Num(R : Racional) return Integer;
      function Get_Den(R : Racional) return Positive;

      -- a) Funções de aritmética (sobrecarga de operadores)
      function "+"(L, R : Racional) return Racional;
      function "-"(L, R : Racional) return Racional;
      function "*"(L, R : Racional) return Racional;
      function "/"(L, R : Racional) return Racional;
      
      -- b) Imprimir em formato fração (a / b)
      procedure Imprimir_Fracao(R : in Racional);
      
      -- c) Imprimir em formato ponto flutuante
      procedure Imprimir_Float(R : in Racional);
      
   private
      -- Parte privada da especificação
      type Racional is record
         -- O denominador é 'Positive' para garantir que nunca seja 0 ou negativo.
         Num : Integer  := 0;
         Den : Positive := 1;
      end record;
      
   end Racional_TDA;

   -----------------------------------------------------------------
   -- CORPO (IMPLEMENTAÇÃO) DO TDA RACIONAL
   -----------------------------------------------------------------
   package body Racional_TDA is
      
      -- Função auxiliar (privada) para calcular o Máximo Divisor Comum (MDC)
      -- Usada para reduzir as frações.
      function GCD(A, B : Integer) return Integer is
         Val_A : Integer := abs A;
         Val_B : Integer := abs B;
         Temp  : Integer;
      begin
         if Val_A = 0 then return Val_B; end if;
         if Val_B = 0 then return Val_A; end if;
         
         while Val_B > 0 loop
            Temp  := Val_A mod Val_B;
            Val_A := Val_B;
            Val_B := Temp;
         end loop;
         return Val_A;
      end GCD;

      -- Implementação do "Construtor"
      function Criar(N : Integer := 0; D : Integer := 1) return Racional is
         Temp_N : Integer := N;
         Temp_D : Integer := D;
         G      : Integer;
      begin
         -- Validação do denominador
         if D = 0 then
            Put_Line("ERRO: Denominador nao pode ser zero.");
            raise Constraint_Error;
         end if;

         -- Normalização do Sinal: O sinal fica sempre no numerador.
         if Temp_D < 0 then
            Temp_N := -Temp_N;
            Temp_D := -Temp_D;
         end if;

         -- Redução da Fração
         G := GCD(Temp_N, Temp_D);
         
         -- Retorna o novo objeto Racional reduzido
         return (Num => Temp_N / G, Den => Positive(Temp_D / G));
      end Criar;

      -- Implementação das funções "get"
      function Get_Num(R : Racional) return Integer is (R.Num);
      function Get_Den(R : Racional) return Positive is (R.Den);

      -- a) Implementação da Aritmética
      
      function "+"(L, R : Racional) return Racional is
         Novo_Num : constant Integer := (L.Num * R.Den) + (R.Num * L.Den);
         Novo_Den : constant Integer := (L.Den * R.Den);
      begin
         -- Retorna a fração já reduzida pelo "construtor"
         return Criar(Novo_Num, Novo_Den);
      end "+";

      function "-"(L, R : Racional) return Racional is
         Novo_Num : constant Integer := (L.Num * R.Den) - (R.Num * L.Den);
         Novo_Den : constant Integer := (L.Den * R.Den);
      begin
         return Criar(Novo_Num, Novo_Den);
      end "-";

      function "*"(L, R : Racional) return Racional is
         Novo_Num : constant Integer := L.Num * R.Num;
         Novo_Den : constant Integer := L.Den * R.Den;
      begin
         return Criar(Novo_Num, Novo_Den);
      end "*";

      function "/"(L, R : Racional) return Racional is
         -- Divisão é a multiplicação pelo inverso
         Novo_Num : constant Integer := L.Num * R.Den;
         Novo_Den : constant Integer := L.Den * R.Num;
      begin
         return Criar(Novo_Num, Novo_Den);
      end "/";
      
      -- b) Implementação da Impressão (Fração)
      procedure Imprimir_Fracao(R : in Racional) is
      begin
         Put(Item => R.Num, Width => 1);
         Put(" / ");
         Put(Item => R.Den, Width => 1);
      end Imprimir_Fracao;
      
      -- c) Implementação da Impressão (Float)
      procedure Imprimir_Float(R : in Racional) is
         Resultado : constant Float := Float(R.Num) / Float(R.Den);
      begin
         -- Formata com 3 dígitos de precisão
         Put(Resultado, Fore => 1, Aft => 3, Exp => 0);
      end Imprimir_Float;

   end Racional_TDA;

   -----------------------------------------------------------------
   -- PROGRAMA PRINCIPAL PARA TESTAR O TDA
   -----------------------------------------------------------------
   
   use Racional_TDA; -- Torna 'Racional', 'Criar', '+', etc. visíveis

begin
   Put_Line("--- Teste TDA Racional ---");
   
   -- Teste 1: Declaração e Redução
   New_Line;
   Put_Line("Teste 1: Criacao e Reducao");
   declare
      R1 : Racional := Criar(10, 20); -- Deve reduzir para 1 / 2
      R2 : Racional := Criar(7, -21); -- Deve reduzir para -1 / 3
   begin
      Put("R1 (10/20) = "); Imprimir_Fracao(R1); New_Line;
      Put("R2 (7/-21) = "); Imprimir_Fracao(R2); New_Line;
   end;
   
   -- Teste 2: Construtor Default
   New_Line;
   Put_Line("Teste 2: Construtor Default");
   declare
      R_Default : Racional := Criar; -- Deve ser 0 / 1
   begin
      Put("R_Default = "); Imprimir_Fracao(R_Default); New_Line;
   end;
   
   -- Teste 3: Aritmética (a)
   New_Line;
   Put_Line("Teste 3: Aritmetica (1/2 e 1/3)");
   declare
      A : Racional := Criar(1, 2);
      B : Racional := Criar(1, 3);
   begin
      Put("A = "); Imprimir_Fracao(A); New_Line;
      Put("B = "); Imprimir_Fracao(B); New_Line;
      
      Put("A + B = "); Imprimir_Fracao(A + B); Put(" (Esperado: 5 / 6)"); New_Line;
      Put("A - B = "); Imprimir_Fracao(A - B); Put(" (Esperado: 1 / 6)"); New_Line;
      Put("A * B = "); Imprimir_Fracao(A * B); Put(" (Esperado: 1 / 6)"); New_Line;
      Put("A / B = "); Imprimir_Fracao(A / B); Put(" (Esperado: 3 / 2)"); New_Line;
   end;
   
   -- Teste 4: Impressão (b e c)
   New_Line;
   Put_Line("Teste 4: Impressao (b e c)");
   declare
      R_Print : Racional := Criar(2, 3);
   begin
      Put("Fracao (b): ");
      Imprimir_Fracao(R_Print); -- Saída: 2 / 3
      New_Line;
      
      Put("Float  (c): ");
      Imprimir_Float(R_Print);  -- Saída: 0.667
      New_Line;
   end;

exception
   when E: Constraint_Error =>
      Put_Line("ERRO FATAL: " & Exception_Information(E));
      
end Solucao_14;