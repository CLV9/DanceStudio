   M S B A M L   `   `   `  ����  CLVP.DanceStudio.WPF1    +CLVP.DanceStudio.WPF.Views.UpdateClientView   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f"calhttp://caliburnmicro.com  5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5   	      MaterialDesignBody#���   5
   	   $��Regular"�5   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	    � Title$ EditClientView��5   	   $	��600��6    $	��520��6-    � WindowStyle$
 None=�6O   ��69   Z� .��5      #  MaterialDesignThemes.Wpf.Card  ���	#FF191A1F.��5   
   �  � RowDefinitions 5      �� 5      $��50 �6    �� 5      $	��140 �6    �� 5      $��2* �6    �� 5      $��70 �6    .+�5      � $��0��6   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Edit=�6*   $��Center=�66   
�������$��20��6d   $��20��6p   $��10,0,0,0q�6{   �� 5      $1��+Редактирование клиента��6   $��Center=�6:   
�������$��	35,0,60,0q�6h   �� 5      -   5         ��Name$ Delete��5      $��30��5      $��30��6    $��0q�5      $��0,0,10,0q�6!   $��Right=�5      $��Center=�61   $��Center=�5       
������ $��0q�5!      .��5"        $��25��5#      $��25��5$      $��Center=�5%      $��Center=�5&      
���  ��$ Delete=�5(      5)      5*      � 5+      $��1��6    � ColumnDefinitions 5,      �� 5-      $
��Auto �6'   �� 5.      $��* �6'    50      �� 51      $
��Auto �6$   �� 52      $
��Auto �6$   �� 53      $
��Auto �6$   .+�56      �� -   5         ��Name$ Model_FullName��56      $��0��62   $��1��6?   
�������$��10q�6b   �� 57      $��ФИО��6   $��0��6'   
�������$��10q�6G   �� 59      -   5        $ Model_Phone��59      $��1��6/   $��1��6<   
�������$��10q�6_   �� 5:      $��Телефон��6   $��1��6+   
�������$��10q�6K   �� 5<      $��Комментарий��6   $��2��6/   
�������$��10q�6O   �� 5=      -   5        $ Model_Comment��5=      $��2��61   $��1��6>   
�������$��10q�6a   5>      � 5?      $��2��6   .+�5@      &   System.Windows.Controls.DataGrid  -   5        	  Name$	 Subscriptions��5@      
   AutoGenerateColumns$
 False��62   $��10,10,10,10q�6N      
IsReadOnly$
 True��6c      Columns 5A      4  .System.Windows.Controls.DataGridTemplateColumn  5B      ,  &System.Windows.Controls.DataGridColumn   Header$  ��61      CellTemplate 5C      �� 5D   "   .R�5E   &   �� ���#673ab7��6-   Z� ��6C   Z� .��5F   *   �� .+�5G   .     $��20��6F   $��20��6Q   $
 Edit=�6]   5H   +   *  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5I   *   +  %Microsoft.Xaml.Behaviors.EventTrigger  5J   .      	EventName$ Click��6=   *	  $Microsoft.Xaml.Behaviors.TriggerBase 	  Actions. 5K   2   "
  Caliburn.Micro.ActionMessage
   
  
MethodName$ EditSubscription��6D    
  
Parameters. 5L   6     Caliburn.Micro.Parameter     Value$ $datacontext��6D   5M   3   5N   /   5P   '   5Q   #   5S        5T      $  ��61    5U      �� 5V   "   .R�5W   &   �� ���#673ab7��6-   Z� ��6C   Z� .��5X   *   �� .+�5Y   .     $��20��6F   $��20��6Q   $ Delete=�6]   5Z   +    5[   *     5\   .   $ Click��6=   . 5]   2   
  $ DeleteSubscription��6D   . 5^   6     $ $datacontext��6D   5_   3   5`   /   5b   '   5c   #   5e        5f      $ Дата начала��61    5g      �� 5h   "   .R�5i   &   (  "System.Windows.Controls.DatePicker    Name$ 	StartDate��61   ${�False��6g      SelectedDate 6D   �� *	StartDate+6g   5j   #   5l        5m      $ Дата конца��61    5n      �� 5o   "   .R�5p   &     $ EndDate��61   ${�False��6c    6B   �� *	EndDate+6c   5q   #   5s      0  *System.Windows.Controls.DataGridTextColumn  5t      $- 'Количество посещений��6-   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6K   ��  �� Path$ VisitsCount�  5u      $# Всего посещений��6-    6F   �� $ TotalVisits�5w      �� 5x      -   5        $ AddSubscription��5x      $��18��5y      $��18��6   $��0q�5z      $��	20,19,0,0q�6   $
��Left=�5{      $	��Top=�6,   
��� � �
�������$��0q�5}      ��5      �� 5�       �� 
TargetType" ��6    .�5�      ��  �� Property � �� �� Value 68   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$	 Add=�5�      5�      5�      � 5�      $��3��6   .+�5�      �� -   5        $ ApplyChanges��5�   ?   $	��150��5�      
��� � �$��Center=�5�      $
��Left=�64   $��40,0,0,5q�5�      $��Применить��6+   6?   �� 5�      -   5        $ CancelChanges��5�   *   $	��150��5�      
���  ��$��Center=�66   $��Right=�5�      $��0,0,40,5q�65   $��Отмена��5�      6*   5�      5�      5�      5�      