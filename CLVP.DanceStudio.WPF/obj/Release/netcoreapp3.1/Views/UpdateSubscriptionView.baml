   M S B A M L   `   `   `  ���� O  KCLVP.DanceStudio.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:CLVP.DanceStudio.WPF.ViewsCLVP.DanceStudio.WPF.Views  7    1CLVP.DanceStudio.WPF.Views.UpdateSubscriptionView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     :local(clr-namespace:CLVP.DanceStudio.WPF.Views     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f"calhttp://caliburnmicro.com  _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors     MaterialDesignBody#���   $��Regular"�$��13(�&   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���   � Title$7 1Редактирование абонемента��$	��600��$	��420�� � WindowStyle$
 None=���Z� .��#  MaterialDesignThemes.Wpf.Card     UniformCornerRadius$ 15Q����	#FF191A1F.���  � RowDefinitions �� $��50 ��� $��3* ��� $��3* ��� $��1* �.+�� $��0��.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Edit=�$��	10,11,0,0q�
�������$��20��$��20���� $7��1Редактирование абонемента��$��	42,13,0,0q�$	��Top=�
�������� $��1�� � ColumnDefinitions �� $
��Auto ��� $��* � �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��ФИО��$��0��
�������$��10q��� $��Дата начала��$��1��
�������$��10q��� $��Дата конца��$��2��
�������$��10q��� $#��Всего посещений��$��3��
�������$��10q��� $-��'Количество посещений��$��4��
�������$��10q��� -    ��Name$ Client_FullName��$��0��$��1��
�������$��10q�	 �� 
IsReadOnly$
	 True��(  "System.Windows.Controls.DatePicker  -   
  Name$
 Subscription_StartDate��$��1��$��1��
�������$��10q�  -   $
 Subscription_EndDate��$��2��$��1��
�������$��10q��� -   $ Subscription_TotalVisits��$��3��$��1��
�������$��10q��� -   $ Subscription_VisitsCount��$��4��$��1��
�������$��10q�$
	 True��� $��2��.+�&   System.Windows.Controls.DataGrid  -     Name$ Visits��   AutoGenerateColumns$ False��   
IsReadOnly$
 True��$��12q�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$  ��   CellTemplate �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$ Delete=�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +	  %Microsoft.Xaml.Behaviors.EventTrigger	   	  	EventName$ Click��*
  $Microsoft.Xaml.Behaviors.TriggerBase 
  Actions. "  Caliburn.Micro.ActionMessage     
MethodName$ DeleteVisit��   
Parameters.   Caliburn.Micro.Parameter     Value$ $datacontext��0  *System.Windows.Controls.DataGridTextColumn  $ Направление��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Direction.Name+  $! Дата посещения�� �� .R�  $
 	VisitDate��${�False��   SelectedDate �� *Date+�� -    ��Name$ AddVisit��$��1��$��15��$��15��$��0q�$��20q�$��Center=�$
��Left=�$	��Top=�$��Center=�
��� � �$��0q�.��  $��15��$��15��$��Center=�$��Center=�
�������$	 Add=�� $��3��.+��� -   $ Create��$	��150��
��� � �$��Center=�$
��Left=�$��40,0,0,5q�$��Применить���� -	   $ Cancel��$	��150��
���  ��$��Center=�$��Right=�$��0,0,40,5q�$��Отмена��