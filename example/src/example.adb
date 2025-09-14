with VSS.Text_Streams.Standards;

with I18n;

procedure Example is

   use type I18n.I18n_Error;

   ----------------------------------------------------------------------------

   procedure Put_Line (Item : I18n.Virtual_String) is
      Success : Boolean := True;
      Stdout  : VSS.Text_Streams.Output_Text_Stream'Class := -- '
        VSS.Text_Streams.Standards.Standard_Output;
   begin
      Stdout.Put_Line (Item, Success);
   end Put_Line;

   ----------------------------------------------------------------------------

   Result : I18n.I18n_Error;

begin

   Result := I18n.Init ("example", "share/locale");

   if Result /= I18n.No_Error then
      Put_Line ("Could not initialize I18n.");
   end if;

   Put_Line
     (I18n.Translate
        ("Translation: 'This is an example' = 'This is an example'"));

   Put_Line (I18n.Translate ("There's a cat.", "There are cats.", 1));
   Put_Line (I18n.Translate ("There's a cat.", "There are cats.", 12));

end Example;
