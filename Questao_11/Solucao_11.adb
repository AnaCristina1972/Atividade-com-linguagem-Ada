with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

procedure Solucao_11 is

   ---------------------------------------------------------------------
   -- QUESTÃO 11: Pacote Stacks (Pilha de Inteiros)
   ---------------------------------------------------------------------
   package Integer_Stacks is
      
      type Stack is limited private;
      Stack_Empty : exception;
      
      procedure Push (S : in out Stack; Item : in Integer);
      function Pop (S : in out Stack) return Integer;
      function Top (S : in Stack) return Integer;
      function Is_Empty (S : in Stack) return Boolean;
      
   private
      type Node;
      type Node_Ptr is access Node;
      type Node is record
         Element : Integer;
         Next    : Node_Ptr;
      end record;
      
      type Stack is limited record
         Top_Node : Node_Ptr := null;
      end record;
      
   end Integer_Stacks;
   
   -- Corpo do pacote Integer_Stacks
   package body Integer_Stacks is
      
      procedure Free is new Ada.Unchecked_Deallocation(Node, Node_Ptr);
      
      procedure Push (S : in out Stack; Item : in Integer) is
         -- O novo nó aponta para o topo antigo
         New_Node : constant Node_Ptr := new Node'(Element => Item, Next => S.Top_Node);
      begin
         -- O topo agora é o novo nó
         S.Top_Node := New_Node;
      end Push;
      
      function Pop (S : in out Stack) return Integer is
         Old_Top : Node_Ptr;
         Item    : Integer;
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
      
      function Top (S : in Stack) return Integer is
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
      
   end Integer_Stacks;

   -- Bloco principal para testar a Solução 11
   use Integer_Stacks;
   My_Int_Stack : Stack;
   
begin
   Put_Line("--- Teste Questão 11 (Pilha de Inteiros) ---");
   
   if Is_Empty(My_Int_Stack) then Put_Line("Pilha criada. Está vazia."); end if;
   
   Push(My_Int_Stack, 100);
   Push(My_Int_Stack, 200);
   Put_Line("Adicionados 100 e 200.");
   
   Put_Line("Elemento do topo: " & Integer'Image(Top(My_Int_Stack)));
   Put_Line("Removendo: " & Integer'Image(Pop(My_Int_Stack)));
   Put_Line("Elemento do topo: " & Integer'Image(Top(My_Int_Stack)));
   Put_Line("Removendo: " & Integer'Image(Pop(My_Int_Stack)));
   
   if Is_Empty(My_Int_Stack) then Put_Line("Pilha está vazia novamente."); end if;
   
exception
   when Stack_Empty =>
      Put_Line("ERRO: Tentou remover de pilha vazia!");

end Solucao_11;