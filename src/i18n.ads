with VSS.Strings;

with Gettext.Locale;

package I18n is

   ----------------------------------------------------------------------------

   subtype Virtual_String is VSS.Strings.Virtual_String;

   type Locale_Category is record
      Value : Gettext.Locale.Locale_Category;
   end record;

   ----------------------------------------------------------------------------

   LC_CTYPE : constant Locale_Category := (Value => Gettext.Locale.LC_CTYPE);

   LC_COLLATE : constant Locale_Category :=
     (Value => Gettext.Locale.LC_COLLATE);

   LC_MONETARY : constant Locale_Category :=
     (Value => Gettext.Locale.LC_MONETARY);

   LC_NUMERIC : constant Locale_Category :=
     (Value => Gettext.Locale.LC_NUMERIC);

   LC_TIME : constant Locale_Category := (Value => Gettext.Locale.LC_TIME);

   LC_MESSAGES : constant Locale_Category :=
     (Value => Gettext.Locale.LC_MESSAGES);

   LC_ALL : constant Locale_Category := (Value => Gettext.Locale.LC_ALL);

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
