   M S B A M L   `   `   `  ���� O  KCLVP.DanceStudio.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:CLVP.DanceStudio.WPF.ViewsCLVP.DanceStudio.WPF.Views  4    .CLVP.DanceStudio.WPF.Views.CalculateSalaryView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     :local(clr-namespace:CLVP.DanceStudio.WPF.Views     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���   � Title$# Расчёт зарплаты��$	��380��$	��420�� � WindowStyle$
 None=���Z� .��#  MaterialDesignThemes.Wpf.Card     UniformCornerRadius$ 15Q����	#FF191A1F.���  � RowDefinitions �� $��50 ��� $��3* ��� $��1* �.+�� $��0��.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 
Calculator=�$��	10,11,0,0q�
�������$��20��$��20���� $#��Расчёт зарплаты��$��	42,13,0,0q�$	��Top=�
�������� $��1�� � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��Направление��$��0��
�������$��10q��� $!��Дата посещения��$��1��
�������$��10q��� $��Направление��$��2��
�������$��10q��� $(��"Сумма за посещение��$��3��
�������$��10q��� $��
Итого��$��4��
�������$��10q��� -    ��Name$ Direction_Name��$��0��$��1��
�������$��10q�	 �� 
IsReadOnly$
	 True��(  "System.Windows.Controls.DatePicker  -   
  Name$
 	StartDate��$��1��$��1��
�������$��10q�  -   $
 EndDate��$��2��$��1��
�������$��10q��� -   $ MoneyForVisit��$��3��$��1��
�������$��10q��� -   $ TotalSalary��$��4��$��1��
�������$��10q�$
	 True��� $��2��.+��� -    ��Name$ CloseWindow��$	��150��
��� � �$��Center=�$��Center=�$��Окей��