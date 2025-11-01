-- Programa para Questões 7 e 8 
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; -- Importação

procedure Solucao_7_e_8 is

   -- Definição do Pacote (Especificação) 
   package People is
      
      -- Tipos base
      type Month_Name is (Jan, Feb, Mar, Apr, May, Jun,
                          Jul, Aug, Sep, Oct, Nov, Dec);
      
      type Date is record
         Day   : Integer range 1..31;
         Month : Month_Name;
         Year  : Integer;
      end record;
      
      -- Tipo Person e suas operações primitivas
      type Person is tagged record
         Birth : Date;
      end record;
      
      -- A operação de Person DEVE ser declarada ANTES dos filhos
      procedure Print_Details (P : in Person);
      
      -- Tipo Man e suas operações
      type Man is new Person with record
         Has_Beard : Boolean := False;
      end record;
      
      --  'overriding' 
      overriding
      procedure Print_Details (M : in Man);
      
      -- Tipo Woman e suas operações
      type Woman is new Person with record
         Children_Breastfed : Natural := 0;
      end record;

      
      overriding
      procedure Print_Details (W : in Woman);
      
      -- Procedimento polimórfico (pode ficar no final)
      procedure Analyze_Person (P : in Person'Class);
      
   end People;
   
   -- Corpo do Pacote 
   package body People is
      
      package Month_IO is new Ada.Text_IO.Enumeration_IO (Month_Name);
     

      -- Implementação de Print_Details para Person
      procedure Print_Details (P : in Person) is
      begin
         Put("  - [Person] Nascido em: ");
         -- Chamada  para Integer_Text_IO
         Ada.Integer_Text_IO.Put(P.Birth.Day, Width => 2); Put("/"); 
         Month_IO.Put(P.Birth.Month); Put("/");
         Ada.Integer_Text_IO.Put(P.Birth.Year, Width => 4);
         New_Line;
      end Print_Details;
      
      -- Implementação de Print_Details para Man (sobrescrita)
      overriding
      procedure Print_Details (M : in Man) is
      begin
         Print_Details(Person(M)); -- Chama o "pai"
         Put("  - [Man] ");
         if M.Has_Beard then
            Put_Line("Possui barba.");
         else
            Put_Line("Não possui barba.");
         end if;
      end Print_Details;
      
      -- Implementação de Print_Details para Woman (sobrescrita)
      overriding
      procedure Print_Details (W : in Woman) is
      begin
         Print_Details(Person(W)); -- Chama o "pai"
         Put("  - [Woman] Amamentou ");
         -- Chamada  para Integer_Text_IO
         Ada.Integer_Text_IO.Put(W.Children_Breastfed, Width => 1); 
         Put_Line(" filhos.");
      end Print_Details;
      
      -- Implementação de Analyze_Person
      procedure Analyze_Person (P : in Person'Class) is
      begin
         Put_Line("Analisando Objeto...");
         Print_Details(P); -- Agora funciona!
      end Analyze_Person;
      
   end People;

   -- Programa Principal (para testar )
   
   use People;
      
   -- Criando objetos de teste
   Some_Person : Person := (Birth => (1, Jan, 1990));
   Some_Man    : Man    := (Birth => (10, Mar, 1985), Has_Beard => True);
   Some_Woman  : Woman  := (Birth => (20, Jul, 1992), Children_Breastfed => 2);
   
begin
   Put_Line("--- Teste Questões 7 & 8 (Polimorfismo) ---");
   
   Analyze_Person(Some_Person);
   New_Line;
   
   Analyze_Person(Some_Man);
   New_Line;
   
   Analyze_Person(Some_Woman);
   New_Line;
   
end Solucao_7_e_8;