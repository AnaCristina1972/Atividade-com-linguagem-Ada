-- Programa para Questão 9
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation; 

procedure Solucao_9 is

   -- Especificação do Pacote
   package Integer_Queues is
      
      type Queue is limited private;
      Queue_Empty : exception;
      
      procedure Enqueue (Q : in out Queue; Item : in Integer);
      function Dequeue (Q : in out Queue) return Integer;
      function Front (Q : in Queue) return Integer;
      function Is_Empty (Q : in Queue) return Boolean;
      
   private
      type Node;
      type Node_Ptr is access Node;
      type Node is record
         Element : Integer;
         Next    : Node_Ptr;
      end record;
      
      type Queue is limited record
         Head : Node_Ptr := null;
         Tail : Node_Ptr := null;
      end record;
      
   end Integer_Queues;
   
   -- Corpo do Pacote
   package body Integer_Queues is
      
      procedure Free is new Ada.Unchecked_Deallocation(Node, Node_Ptr);
      
      procedure Enqueue (Q : in out Queue; Item : in Integer) is
         New_Node : constant Node_Ptr := new Node'(Element => Item, Next => null);
      begin
         if Q.Tail = null then 
            Q.Head := New_Node;
            Q.Tail := New_Node;
         else
            Q.Tail.Next := New_Node;
            Q.Tail := New_Node;
         end if;
      end Enqueue;
      
      function Dequeue (Q : in out Queue) return Integer is
         Old_Head : Node_Ptr;
         Item     : Integer;
      begin
         if Is_Empty(Q) then
            raise Queue_Empty;
         end if;
         
         Old_Head := Q.Head;
         Item := Old_Head.Element;
         Q.Head := Old_Head.Next;
         
         if Q.Head = null then 
            Q.Tail := null;
         end if;
         
         Free(Old_Head);
         return Item;
      end Dequeue;
      
      function Front (Q : in Queue) return Integer is
      begin
         if Is_Empty(Q) then
            raise Queue_Empty;
         end if;
         return Q.Head.Element;
      end Front;
      
      function Is_Empty (Q : in Queue) return Boolean is
      begin
         return Q.Head = null;
      end Is_Empty;
      
   end Integer_Queues;

   -- Programa Principal (para testar no OneCompiler)
   use Integer_Queues;
   My_Int_Queue : Queue;

begin
   Put_Line("--- Teste Questão 9 (Fila de Inteiros) ---");
   
   if Is_Empty(My_Int_Queue) then Put_Line("Fila criada. Está vazia."); end if;
   
   Enqueue(My_Int_Queue, 10);
   Enqueue(My_Int_Queue, 20);
   Put_Line("Adicionados 10 e 20.");
   
   Put_Line("Elemento da frente: " & Integer'Image(Front(My_Int_Queue)));
   Put_Line("Removendo: " & Integer'Image(Dequeue(My_Int_Queue)));
   Put_Line("Elemento da frente: " & Integer'Image(Front(My_Int_Queue)));
   Put_Line("Removendo: " & Integer'Image(Dequeue(My_Int_Queue)));
   
   if Is_Empty(My_Int_Queue) then Put_Line("Fila está vazia novamente."); end if;

exception
   when Queue_Empty =>
      Put_Line("ERRO: Tentou remover de fila vazia!");
      
end Solucao_9;