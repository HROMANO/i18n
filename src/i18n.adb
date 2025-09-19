with Ada.Strings.UTF_Encoding;

with VSS.Strings.Conversions;

package body I18n is

   ----------------------------------------------------------------------------

   function "+"
     (Item : Ada.Strings.UTF_Encoding.UTF_8_String) return Virtual_String
   renames VSS.Strings.Conversions.To_Virtual_String;

   ----------------------------------------------------------------------------

   function "+"
     (Item : Virtual_String'Class) return Ada.Strings.UTF_Encoding.UTF_8_String
   renames VSS.Strings.Conversions.To_UTF_8_String;

   ----------------------------------------------------------------------------

   Default_Domain    : constant Ada.Strings.UTF_Encoding.UTF_8_String :=
     Gettexts.Get_Domain_Name;
   Default_Directory : constant Ada.Strings.UTF_Encoding.UTF_8_String :=
     Gettexts.Get_Domain_Directory (Default_Domain);

   ----------------------------------------------------------------------------

   function Init
     (Domain : Virtual_String := ""; Directory : Virtual_String := "")
      return I18n_Error
   is

      use type Virtual_String;

      Temporary_Domain    : Virtual_String;
      Temporary_Directory : Virtual_String;

   begin

      if Gettexts.Locale.Set_Locale = False then
         return Locale_Error;
      end if;

      if Directory = "" then
         Temporary_Directory := +Default_Directory;
      else
         Temporary_Directory := Directory;
      end if;

      if Domain = "" then
         Temporary_Domain := +Default_Domain;
      else
         Temporary_Domain := Domain;
      end if;

      if Gettexts.Set_Domain_Directory (+Temporary_Domain, +Directory) = False
      then
         return Domain_Directory_Error;
      end if;

      if Gettexts.Set_Domain_Name (+Temporary_Domain) = False then
         return Text_Domain_Error;
      end if;

      if Gettexts.Set_Domain_Codeset (+Temporary_Domain, "utf8") = False then
         return Domain_Codeset_Error;
      end if;

      return No_Error;

   end Init;

   ----------------------------------------------------------------------------

   function Translate (Message : Virtual_String) return Virtual_String
   is (+Gettexts.Get_Text (+Message));

   ----------------------------------------------------------------------------

   function Translate
     (Singular : Virtual_String; Plural : Virtual_String; N : Natural)
      return Virtual_String
   is (+Gettexts.Get_Plural_Text (+Singular, +Plural, N));

   ----------------------------------------------------------------------------

   function Translate
     (Domain : Virtual_String; Message : Virtual_String) return Virtual_String
   is (+Gettexts.Get_Text_With_Domain (+Domain, +Message));

   ----------------------------------------------------------------------------

   function Translate
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String
   is (+Gettexts.Get_Plural_Text_With_Domain (+Domain, +Singular, +Plural, N));

   ----------------------------------------------------------------------------

   function Translate
     (Domain   : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String
   is (+Gettexts.Get_Text_With_Domain_Category (+Domain, +Message, Category));

   ----------------------------------------------------------------------------

   function Translate
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String
   is (+Gettexts.Get_Plural_Text_With_Domain_Category
          (+Domain, +Singular, +Plural, N, Category));

   ----------------------------------------------------------------------------

   function Translate_With_Context
     (Context : Virtual_String; Message : Virtual_String) return Virtual_String
   is (+Gettexts.Get_Text_With_Context (+Context, +Message));

   ----------------------------------------------------------------------------

   function Translate_With_Context
     (Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String
   is (+Gettexts.Get_Plural_Text_With_Context
          (+Context, +Singular, +Plural, N));

   ----------------------------------------------------------------------------

   function Translate_With_Context
     (Domain  : Virtual_String;
      Context : Virtual_String;
      Message : Virtual_String) return Virtual_String
   is (+Gettexts.Get_Text_With_Domain_Context (+Domain, +Context, +Message));

   ----------------------------------------------------------------------------

   function Translate_With_Context
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String
   is (+Gettexts.Get_Plural_Text_With_Domain_Context
          (+Domain, +Context, +Singular, +Plural, N));

   ----------------------------------------------------------------------------

   function Translate_With_Context
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String
   is (+Gettexts.Get_Text_With_Domain_Context_Category
          (+Domain, +Context, +Message, Category));

   ----------------------------------------------------------------------------

   function Translate_With_Context
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String
   is (+Gettexts.Get_Plural_Text_With_Domain_Context_Category
          (+Domain, +Context, +Singular, +Plural, N, Category));

   ----------------------------------------------------------------------------

end I18n;
