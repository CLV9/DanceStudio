   M S B A M L   `   `   `  ���� O  KCLVP.DanceStudio.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:CLVP.DanceStudio.WPF.ViewsCLVP.DanceStudio.WPF.Views  1    +CLVP.DanceStudio.WPF.Views.CreateClientView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     :local(clr-namespace:CLVP.DanceStudio.WPF.Views     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���   � Title$ EditClientView��$	��270��$	��520�� � WindowStyle$
 None=���Z� .��#  MaterialDesignThemes.Wpf.Card  ���	#FF191A1F.���  � RowDefinitions �� $��50 ��� $	��140 ��� $��70 �.+�� $��0��.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$	 Add=�$��Center=�
�������$��20��$��20��$��10,0,0,0q��� $%��Создание клиента��$��Center=�
�������$��	35,0,60,0q�� $��1�� � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��ФИО��$��0��
�������$��10q��� $��Телефон��$��1��
�������$��10q��� -    ��Name$ Model_FullName��$��0��$��1��
�������$��10q��� -   $ Model_Phone��$��1��$��1��
�������$��10q��� $��Комментарий��$��2��
�������$��10q��� -   $ Model_Comment��$��2��$��1��
�������$��10q�� $��3��.+��� -    ��Name$ Create��$	��150��
��� � �$��Center=�$
��Left=�$��40,0,0,5q�$��Создать���� -   $ Cancel��$	��150��
���  ��$��Center=�$��Right=�$��0,0,40,5q�$��Отмена��