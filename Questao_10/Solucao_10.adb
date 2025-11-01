-- Programa para Questão 10
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with Ada.Strings.Unbounded;     
use Ada.Strings.Unbounded;

procedure Solucao_10 is

   -- Especificação do Pacote Genérico
   generic
      type Element_Type is private;
   package Generic_Queues is
      
      type Queue is limited private;
      Queue_Empty : exception;
      
      procedure Enqueue (Q : in out Queue; Item : in Element_Type);
      function Dequeue (Q : in out Queue) return Element_Type;
      function Front (Q : in Queue) return Element_Type;
      function Is_Empty (Q : in Queue) return Boolean;
      
   private
      type Node;
      type Node_Ptr is access Node;
      type Node is record
         Element : Element_Type;
         Next    : Node_Ptr;
      end record;
      
      type Queue is limited record
         Head : Node_Ptr := null;
         Tail : Node_Ptr := null;
      end record;
      
   end Generic_Queues;
   

   package body Generic_Queues is
      
      procedure Free is new Ada.Unchecked_Deallocation(Node, Node_Ptr);
      
      procedure Enqueue (Q : in out Queue; Item : in Element_Type) is
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
      
      function Dequeue (Q : in out Queue) return Element_Type is
         Old_Head : Node_Ptr;
         Item     : Element_Type;
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
      
      function Front (Q : in Queue) return Element_Type is
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
      
   end Generic_Queues;

   -- Programa Principal (para testar no OneCompiler)
   
   -- <<< 2. INSTANCIE COM 'Unbounded_String' EM VEZ DE 'String'
   package String_Queues is new Generic_Queues(Element_Type => Unbounded_String);
   use String_Queues;
   
   My_String_Queue : Queue;
   
begin
   Put_Line("--- Teste Questão 10 (Fila Genérica de Strings) ---");
   

   Enqueue(My_String_Queue, To_Unbounded_String("Ola"));
   Enqueue(My_String_Queue, To_Unbounded_String("Mundo"));
   Put_Line("Adicionados 'Ola' e 'Mundo'.");
   

   Put_Line("Elemento da frente: " & To_String(Front(My_String_Queue)));
   Put_Line("Removendo: " & To_String(Dequeue(My_String_Queue)));
   Put_Line("Removendo: " & To_String(Dequeue(My_String_Queue)));
   
   if Is_Empty(My_String_Queue) then Put_Line("Fila de strings vazia."); end if;

exception
   when Queue_Empty =>
      Put_Line("ERRO: Tentou remover de fila vazia!");
      
end Solucao_10;