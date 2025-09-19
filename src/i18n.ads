with VSS.Strings;

with Gettexts.Locale;

package I18n is

   ----------------------------------------------------------------------------

   subtype Virtual_String is VSS.Strings.Virtual_String;

   subtype Locale_Category is Gettexts.Locale.Locale_Category;

   ----------------------------------------------------------------------------

   function LC_CTYPE return Locale_Category renames Gettexts.Locale.LC_CTYPE;
   function LC_COLLATE return Locale_Category
   renames Gettexts.Locale.LC_COLLATE;
   function LC_MONETARY return Locale_Category
   renames Gettexts.Locale.LC_MONETARY;
   function LC_NUMERIC return Locale_Category
   renames Gettexts.Locale.LC_NUMERIC;
   function LC_TIME return Locale_Category renames Gettexts.Locale.LC_TIME;
   function LC_MESSAGES return Locale_Category
   renames Gettexts.Locale.LC_MESSAGES;
   function LC_ALL return Locale_Category renames Gettexts.Locale.LC_ALL;

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

   function Translate_With_Context
     (Context : Virtual_String; Message : Virtual_String)
      return Virtual_String;

   function Translate_With_Context
     (Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String;

   function Translate_With_Context
     (Domain  : Virtual_String;
      Context : Virtual_String;
      Message : Virtual_String) return Virtual_String;

   function Translate_With_Context
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String;

   function Translate_With_Context
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String;

   function Translate_With_Context
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String;

   ----------------------------------------------------------------------------

   -- Common shortcuts

   function Tr (Message : Virtual_String) return Virtual_String
   renames Translate;

   function Tr
     (Singular : Virtual_String; Plural : Virtual_String; N : Natural)
      return Virtual_String renames Translate;

   function Tr
     (Domain : Virtual_String; Message : Virtual_String) return Virtual_String
   renames Translate;

   function Tr
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String renames Translate;

   function Tr
     (Domain   : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String renames Translate;

   function Tr
     (Domain   : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String renames Translate;

   function Ctr
     (Context : Virtual_String; Message : Virtual_String) return Virtual_String
   renames Translate_With_Context;

   function Ctr
     (Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String renames Translate_With_Context;

   function Ctr
     (Domain  : Virtual_String;
      Context : Virtual_String;
      Message : Virtual_String) return Virtual_String
   renames Translate_With_Context;

   function Ctr
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural) return Virtual_String renames Translate_With_Context;

   function Ctr
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Message  : Virtual_String;
      Category : Locale_Category) return Virtual_String
   renames Translate_With_Context;

   function Ctr
     (Domain   : Virtual_String;
      Context  : Virtual_String;
      Singular : Virtual_String;
      Plural   : Virtual_String;
      N        : Natural;
      Category : Locale_Category) return Virtual_String
   renames Translate_With_Context;

end I18n;
