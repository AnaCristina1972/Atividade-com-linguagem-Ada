-- Programa para Questão 12 

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; -- Importa o pacote de I/O para Floats
with Ada.Unchecked_Deallocation;

procedure Solucao_12 is

   ---------------------------------------------------------------------
   -- QUESTÃO 12: Pacote Genérico para Stacks
   ---------------------------------------------------------------------
   generic
      type Element_Type is private;
   package Generic_Stacks is
      
      type Stack is limited private;
      Stack_Empty : exception;
      
      procedure Push (S : in out Stack; Item : in Element_Type);
      function Pop (S : in out Stack) return Element_Type;
      function Top (S : in Stack) return Element_Type;
      function Is_Empty (S : in Stack) return Boolean;
      
   private
      type Node;
      type Node_Ptr is access Node;
      type Node is record
         Element : Element_Type;
         Next    : Node_Ptr;
      end record;
      
      type Stack is limited record
         Top_Node : Node_Ptr := null;
      end record;
      
   end Generic_Stacks;
   
   -- Corpo do pacote Generic_Stacks
   
   package body Generic_Stacks is
      
      procedure Free is new Ada.Unchecked_Deallocation(Node, Node_Ptr);
      
      procedure Push (S : in out Stack; Item : in Element_Type) is
         New_Node : constant Node_Ptr := new Node'(Element => Item, Next => S.Top_Node);
      begin
         S.Top_Node := New_Node;
      end Push;
      
      function Pop (S : in out Stack) return Element_Type is
         Old_Top : Node_Ptr;
         Item    : Element_Type;
      begin
         if Is_Empty(S) then
            raise Stack_Empty;
         end if;
         
         Old_Top := S.Top_Node;
         Item := Old_Top.Element;
         
         S.Top_Node := Old_Top.Next;
         Free(Old_Top);
         return Item;
      end Pop;
      
      function Top (S : in Stack) return Element_Type is
      begin
         if Is_Empty(S) then
            raise Stack_Empty;
         end if;
         return S.Top_Node.Element;
      end Top;
      
      function Is_Empty (S : in Stack) return Boolean is
      begin
         return S.Top_Node = null;
      end Is_Empty;
      
   end Generic_Stacks;
   
   -- Bloco principal para testar a Solução 12
   
   -- Instanciando o pacote genérico para o tipo Float
   package Float_Stacks is new Generic_Stacks(Element_Type => Float);
   use Float_Stacks;
   
   -- Não há necessidade de instanciar o Ada.Float_Text_IO
   
   My_Float_Stack : Stack;
   
begin
   Put_Line("--- Teste Questão 12 (Pilha Genérica de Floats) ---");
   
   if Is_Empty(My_Float_Stack) then Put_Line("Pilha criada. Está vazia."); end if;

   Push(My_Float_Stack, 3.14);
   Push(My_Float_Stack, 1.618);
   Put_Line("Adicionados 3.14 e 1.618.");
   
   -- Chamando 'Ada.Float_Text_IO.Put' 
   -- e adicionando formatação (Fore, Aft, Exp).
   Put("Elemento do topo: "); 
   Ada.Float_Text_IO.Put(Top(My_Float_Stack), Fore => 1, Aft => 3, Exp => 0); 
   New_Line;
   
   Put("Removendo: "); 
   Ada.Float_Text_IO.Put(Pop(My_Float_Stack), Fore => 1, Aft => 3, Exp => 0); 
   New_Line;
   
   Put("Elemento do topo: "); 
   Ada.Float_Text_IO.Put(Top(My_Float_Stack), Fore => 1, Aft => 2, Exp => 0); 
   New_Line;
   
   Put("Removendo: "); 
   Ada.Float_Text_IO.Put(Pop(My_Float_Stack), Fore => 1, Aft => 2, Exp => 0); 
   New_Line;
   
   if Is_Empty(My_Float_Stack) then Put_Line("Pilha de floats vazia."); end if;

exception
   when Stack_Empty =>
      Put_Line("ERRO: Tentou remover de pilha vazia!");

end Solucao_12;