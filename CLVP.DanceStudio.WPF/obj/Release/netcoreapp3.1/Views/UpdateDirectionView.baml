   M S B A M L   `   `   `  ����   CLVP.DanceStudio.WPF4    .CLVP.DanceStudio.WPF.Views.UpdateDirectionView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes     MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���   � Title$9 3Редактирование направления��$	��250��$	��520�� � WindowStyle$
 None=���Z� .��#  MaterialDesignThemes.Wpf.Card  ���	#FF191A1F.���  � RowDefinitions �� $��50 ��� $	��100 ��� $��70 �.+�� $��0��.+��� -    ��Name$ Delete��$��30��$��30��$��0q�$��0,0,10,0q�$��Right=�$��Center=�$��Center=�
������ $��0q�.��'  !MaterialDesignThemes.Wpf.PackIcon  $��25��$��25��$��Center=�$��Center=�
���  ��   Kind$ Delete=�  $	 Add=�$��Center=�
�������$��20��$��20��$��10,0,0,0q��� $9��3Редактирование направления��$��Center=�
�������$��	35,0,60,0q�� $��1�� � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto �.+��� $��Название��$��0��
�������$��10q��� -    ��Name$ 
Model_Name��$��0��$��1��
�������$��10q�� $��3��.+��� -   $ ApplyChanges��$	��150��
��� � �$��Center=�$
��Left=�$��40,0,0,5q�$��Применить���� -   $ CancelChanges��$	��150��
���  ��$��Center=�$��Right=�$��0,0,40,5q�$��Отмена��