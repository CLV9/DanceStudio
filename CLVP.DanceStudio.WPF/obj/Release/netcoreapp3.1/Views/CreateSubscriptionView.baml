   M S B A M L   `   `   `  ���� O  KCLVP.DanceStudio.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:CLVP.DanceStudio.WPF.ViewsCLVP.DanceStudio.WPF.Views  7    1CLVP.DanceStudio.WPF.Views.CreateSubscriptionView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     :local(clr-namespace:CLVP.DanceStudio.WPF.Views     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���   � Title$+ %Создание абонемента��$	��320��$	��420�� � WindowStyle$
 None=���Z� .��#  MaterialDesignThemes.Wpf.Card     UniformCornerRadius$ 15Q����	#FF191A1F.���  � RowDefinitions �� $��50 ��� $��3* ��� $��1* �.+�� $��0��.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$	 Add=�$��	10,11,0,0q�
�������$��20��$��20���� $+��%Создание абонемента��$��	42,13,0,0q�$	��Top=�
�������� $��1�� � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��ФИО��$��0��
�������$��10q��� $��Дата начала��$��1��
�������$��10q��� $��Дата конца��$��2��
�������$��10q��� $-��'Количество посещений��$��3��
�������$��10q��� -    ��Name$ Client_FullName��$��0��$��1��
�������$��10q�	 �� 
IsReadOnly$
	 True��(  "System.Windows.Controls.DatePicker  -   
  Name$
 Subscription_StartDate��$��1��$��1��
�������$��10q�  -   $
 Subscription_EndDate��$��2��$��1��
�������$��10q��� -   $ Subscription_TotalVisits��$��3��$��1��
�������$��10q�� $��2��.+��� -    ��Name$ Create��$	��150��
��� � �$��Center=�$
��Left=�$��40,0,0,5q�$��Создать���� -   $ Cancel��$	��150��
���  ��$��Center=�$��Right=�$��0,0,40,5q�$��Отмена��