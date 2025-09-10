with VSS.Strings;

with Gettext.Locale;

package I18n is

   ----------------------------------------------------------------------------

   subtype Virtual_String is VSS.Strings.Virtual_String;

   subtype Locale_Category is Gettext.Locale.Locale_Category;

   ----------------------------------------------------------------------------

   LC_CTYPE    : Locale_Category renames Gettext.Locale.LC_CTYPE;
   LC_COLLATE  : Locale_Category renames Gettext.Locale.LC_COLLATE;
   LC_MONETARY : Locale_Category renames Gettext.Locale.LC_MONETARY;
   LC_NUMERIC  : Locale_Category renames Gettext.Locale.LC_NUMERIC;
   LC_TIME     : Locale_Category renames Gettext.Locale.LC_TIME;
   LC_MESSAGES : Locale_Category renames Gettext.Locale.LC_MESSAGES;
   LC_ALL      : Locale_Category renames Gettext.Locale.LC_ALL;

   ----------------------------------------------------------------------------

   type I18n_Error is
     (No_Error,
      Locale_Error,
      Text_Domain_Error,
      Domain_Directory_Error,
      Domain_Codeset_Error);

   ----------------------------------------------------------------------------

   function Init
     (Domain : Virtual_String := ""; Directory : Virtual_String := "")
      return I18n_Error;

   function Translate (Message : Virtual_String) return Virtual_String;

   function Translate
     (Singular : Virtual_String; Plural : Virtual_String; N : Natural)
      return Virtual_String;

   function Translate
     (Domain : Virtual_String; Message : Virtual_String) return Virtual_String;

   function Translate
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String;

   function Translate
     (Domain   : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String;

   function Translate
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String;

   ----------------------------------------------------------------------------

end I18n;
