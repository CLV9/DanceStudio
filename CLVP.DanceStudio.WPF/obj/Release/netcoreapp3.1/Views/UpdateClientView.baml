   M S B A M L   `   `   `  ����   CLVP.DanceStudio.WPF1    +CLVP.DanceStudio.WPF.Views.UpdateClientView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f"calhttp://caliburnmicro.com  _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors     MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���   � Title$ EditClientView��$	��600��$	��520�� � WindowStyle$
 None=���Z� .��#  MaterialDesignThemes.Wpf.Card  ���	#FF191A1F.���  � RowDefinitions �� $��50 ��� $	��140 ��� $��2* ��� $��70 �.+�� $��0��.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Edit=�$��Center=�
�������$��20��$��20��$��10,0,0,0q��� $1��+Редактирование клиента��$��Center=�
�������$��	35,0,60,0q��� -    ��Name$ Delete��$��30��$��30��$��0q�$��0,0,10,0q�$��Right=�$��Center=�$��Center=�
������ $��0q�.��  $��25��$��25��$��Center=�$��Center=�
���  ��$ Delete=�� $��1�� � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� -    ��Name$ Model_FullName��$��0��$��1��
�������$��10q��� $��ФИО��$��0��
�������$��10q��� -   $ Model_Phone��$��1��$��1��
�������$��10q��� $��Телефон��$��1��
�������$��10q��� $��Комментарий��$��2��
�������$��10q��� -   $ Model_Comment��$��2��$��1��
�������$��10q�� $��2��.+�&   System.Windows.Controls.DataGrid  -   	  Name$	 Subscriptions��
   AutoGenerateColumns$
 False��$��10,10,10,10q�   
IsReadOnly$
 True��   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$  ��   CellTemplate �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$
 Edit=�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Click��*	  $Microsoft.Xaml.Behaviors.TriggerBase 	  Actions. "
  Caliburn.Micro.ActionMessage
   
  
MethodName$ EditSubscription�� 
  
Parameters.   Caliburn.Micro.Parameter     Value$ $datacontext��  $  �� �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$ Delete=�   $ Click��. 
  $ DeleteSubscription��.   $ $datacontext��  $ Дата начала�� �� .R�(  "System.Windows.Controls.DatePicker    Name$ 	StartDate��${�False��   SelectedDate �� *	StartDate+  $ Дата конца�� �� .R�  $ EndDate��${�False�� �� *	EndDate+0  *System.Windows.Controls.DataGridTextColumn  $- 'Количество посещений��1  +System.Windows.Controls.DataGridBoundColumn   Binding ��  �� Path$ VisitsCount�  $# Всего посещений�� �� $ TotalVisits��� -   $ AddSubscription��$��18��$��18��$��0q�$��	20,19,0,0q�$
��Left=�$	��Top=�
��� � �
�������$��0q�����  �� 
TargetType" ��.���  �� Property � �� �� Value 0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$	 Add=�� $��3��.+��� -   $ ApplyChanges��$	��150��
��� � �$��Center=�$
��Left=�$��40,0,0,5q�$��Применить���� -   $ CancelChanges��$	��150��
���  ��$��Center=�$��Right=�$��0,0,40,5q�$��Отмена��