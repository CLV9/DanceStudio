   M S B A M L   `   `   `  ����  CLVP.DanceStudio.WPF4    .CLVP.DanceStudio.WPF.Views.UpdateDirectionView   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	      MaterialDesignBody#���   5   	   $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	    � Title$9 3Редактирование направления��5   	   $	��250��6,   $	��520��69    � WindowStyle$
 None=�6[   ��6E   Z� .��5      #  MaterialDesignThemes.Wpf.Card  ���	#FF191A1F.��5   
   �  � RowDefinitions 5      �� 5      $��50 �6    �� 5      $	��100 �6    �� 5      $��70 �6    .+�5      � $��0��6   .+�5      �� -   5         ��Name$ Delete��5      $��30��5      $��30��6    $��0q�5      $��0,0,10,0q�6!   $��Right=�5      $��Center=�61   $��Center=�5      
������ $��0q�5      .��5      '  !MaterialDesignThemes.Wpf.PackIcon  $��25��5      $��25��5      $��Center=�5       $��Center=�5!      
���  ��   Kind$ Delete=�5#      5$        5%      $	 Add=�6*   $��Center=�65   
�������$��20��6c   $��20��6o   $��10,0,0,0q�6z   �� 5&      $9��3Редактирование направления��6   $��Center=�6>   
�������$��	35,0,60,0q�6l   5'      � 5(      $��1��6    � ColumnDefinitions 5)      �� 5*      $
��Auto �6'   �� 5+      $��* �6'    5-      �� 5.      $
��Auto �6$   .+�51      �� $��Название��6   $��0��6,   
�������$��10q�6L   �� 52      -   5         ��Name$ 
Model_Name��52      $��0��6.   $��1��6;   
�������$��10q�6^   53      � 54      $��3��6   .+�55      �� -   5        $ ApplyChanges��57   ?   $	��150��55      
��� � �$��Center=�56      $
��Left=�64   $��40,0,0,5q�57      $��Применить��6+   6?   �� 59      -   5        $ CancelChanges��5;   *   $	��150��59      
���  ��$��Center=�66   $��Right=�5:      $��0,0,40,5q�65   $��Отмена��5;      6*   5<      5=      5>      5?      