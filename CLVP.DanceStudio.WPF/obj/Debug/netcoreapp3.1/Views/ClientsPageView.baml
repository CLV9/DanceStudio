   M S B A M L   `   `   `  ����  CLVP.DanceStudio.WPF0    *CLVP.DanceStudio.WPF.Views.ClientsPageView   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5      ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f"calhttp://caliburnmicro.com  5      b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .��5      � 
�������  � RowDefinitions  5   
   �� 5      $��60 �6   �� 5      $��* �6   .+�5   
   � $��0��6    � ColumnDefinitions 5      �� 5      $��3* �6#   �� 5      $	��150 �6#   �� 5      $	��150 �6#   �� 5      $	��200 �6#   .+�5      � $��0��6   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�6*   $��20��68   $��20��6C   $��10,0,0,0q�6O   $��Center=�6a   �� 5      $	��255��6o   $��Center=�6{   $
��Left=�6�   $��35,0,0,0q�6�   ��6   ��  �� Path$ SearchString� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�6�   5      (  "System.Windows.Controls.DatePicker  5      -   5          Name$ 	StartDate��5      $	��130��6,   $��1��68     5      -   5        $ EndDate��5      $	��130��6*   $��2��66   �� 5      -   5         ��Name$ 
Directions��5      $��3��6+   
�������
���   �$��	10,0,30,0q�6a    �� DisplayMemberPath$
 Name��5      	 �� SelectedItem	 5      �� $ SelectedDirection�$ TwoWay=�5      �� 5       -   5        
 ��Name$
 ClearDirection��5       $��3��5!      $��15��6!   $��15��6,   $��0q�5"      $��0,0,10,0q�6   $��Right=�5#      $��Center=�6-   $��Center=�5$      
������ $��0q�5%      .��5'        $��15��5(      $��15��5)      $��Center=�5*      $��Center=�5+      
�������$ Close=�5-      5.      5/      &   System.Windows.Controls.DataGrid  50   
   -   5          Name$ ClientsTable��50       $��1��6      AutoGenerateColumns$
 True��66      
IsReadOnly$
 True��6Q      Columns 51      4  .System.Windows.Controls.DataGridTemplateColumn  52      ,  &System.Windows.Controls.DataGridColumn   Header$  ��6)      CellTemplate 53      �� 54      .R�55      �� ���#673ab7��6%   Z� ��6;   Z� .��56   "   �� .+�57   &     $��20��6>   $��20��6I   $
 Edit=�6U   58   #   *  $Microsoft.Xaml.Behaviors.Interaction   Triggers 59   "   +  %Microsoft.Xaml.Behaviors.EventTrigger  5:   &      	EventName$ Click��65   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5;   *   "	  Caliburn.Micro.ActionMessage	   	  
MethodName$ 
EditClient��6<    	  
Parameters. 5<   .   
  Caliburn.Micro.Parameter
   
  Value$ $datacontext��6<   5=   +   5>   '   5@      5A      5C        5D      $  ��6)    5E      �� 5F      .R�5G      �� ���#673ab7��6%   Z� ��6;   Z� .��5H   "   �� .+�5I   &     $��20��6>   $��20��6I   $ Calendar=�6U   5J   #    5K   "     5L   &   $ Click��65   . 5M   *   	  $ AddVisit��6<   . 5N   .   
  $ $datacontext��6<   5O   +   5P   '   5R      5S      5U      5W      �� 5X   
   -   5        $
 CreateClient��5X      $��1��6'   $��15��5Y      $��15��6   $��0q�5Z      $��12q�6   $��Center=�5[      $
��Left=�5\      $	��Top=�6,   $��Center=�5]      
��� � �$��0q�5^      .��5`        $��15��5a      $��15��5b      $��Center=�5c      $��Center=�5d      
�������$	 Add=�5f      5g      #  MaterialDesignThemes.Wpf.Card  5h   
   $��1��6      UniformCornerRadius$ 10Q�6+   $	��100��5i      $��30��6*   $��Bottom=�5j      $��Right=�69   $��30q�5k      .��5l      �  5m      �� 5n      $��30 �6'   �� 5o      $��40 �6'   �� 5p      $��30 �6'   .+�5r      �� -   5        $
 SetPreviousPage��5r       &  "MaterialDesignFloatingActionButton#��[  62   $��30��6n   $��30��6y   
�������$��0q�5t      $��0��6-   ��5s   +   Z� ��6B   Z� .��5u      �� $��-5q�6!   .+�5v        $ 	ArrowLeft=�62   5w      5x      �� 5y      -   5         ��Name$ PagingString��5y   �   $��Center=�6    �� TextAlignment$ Center=�69   $	��1/2��6P   $��Center=�6[   $��40��6v   $
��Bold"�6�   $��1��6�   6�   �� 5z      -	   5        $
 SetNextPage��5z      #��[  6.   $��30��6j   $��30��6u   
�������$��0q�5|      $��2��6-   ��5{   +   Z� ��6B   Z� .��5}      �� $��-5q�6!   .+�5~        $ 
ArrowRight=�62   5      5�      5�      5�      5�      5�      