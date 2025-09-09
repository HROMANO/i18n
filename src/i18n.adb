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

   function Init
     (Domain : Virtual_String; Directory : Virtual_String) return I18n_Error
   is

      Temporary_Domain : Ada.Strings.UTF_Encoding.UTF_8_String := +Domain;

   begin

      if Gettext.Locale.Set_Locale = False then
         return Locale_Error;

      elsif Gettext.Set_Text_Domain_Directory (Temporary_Domain, +Directory)
        = False
      then
         return Domain_Directory_Error;

      elsif Gettext.Set_Text_Domain (Temporary_Domain) = False then
         return Text_Domain_Error;

      elsif Gettext.Set_Text_Domain_Codeset (Temporary_Domain, "utf8") = False
      then
         return Domain_Codeset_Error;

      else
         return No_Error;

      end if;

   end Init;

   ----------------------------------------------------------------------------

   function Translate (Message : Virtual_String) return Virtual_String
   is (+Gettext.Get_Text (+Message));

   ----------------------------------------------------------------------------

   function Translate
     (Singular : Virtual_String; Plural : Virtual_String; N : Natural)
      return Virtual_String
   is (+Gettext.N_Get_Text (+Singular, +Plural, N));

   ----------------------------------------------------------------------------

   function Translate
     (Domain : Virtual_String; Message : Virtual_String) return Virtual_String
   is (+Gettext.Domain_Get_Text (+Domain, +Message));

   ----------------------------------------------------------------------------

   function Translate
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String
   is (+Gettext.Domain_N_Get_Text (+Domain, +Singular, +Plural, N));

   ----------------------------------------------------------------------------

   function Translate
     (Domain   : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String
   is (+Gettext.Domain_Category_Get_Text (+Domain, +Message, Category.Value));

   ----------------------------------------------------------------------------

   function Translate
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String
   is (+Gettext.Domain_Category_N_Get_Text
          (+Domain, +Singular, +Plural, N, Category.Value));

   ----------------------------------------------------------------------------

end I18n;
