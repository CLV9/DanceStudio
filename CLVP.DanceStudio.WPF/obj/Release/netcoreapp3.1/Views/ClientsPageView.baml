   M S B A M L   `   `   `  ����   CLVP.DanceStudio.WPF0    *CLVP.DanceStudio.WPF.Views.ClientsPageView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f"calhttp://caliburnmicro.com  b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  .��� 
�������  � RowDefinitions  �� $��60 ��� $��* �.+�� $��0�� � ColumnDefinitions �� $��3* ��� $	��150 ��� $	��150 ��� $	��200 �.+�� $��0��.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�$��20��$��20��$��10,0,0,0q�$��Center=��� $	��255��$��Center=�$
��Left=�$��35,0,0,0q�����  �� Path$ SearchString� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�(  "System.Windows.Controls.DatePicker  -     Name$ 	StartDate��$	��130��$��1��  -   $ EndDate��$	��130��$��2���� -    ��Name$ 
Directions��$��3��
�������
���   �$��	10,0,30,0q� �� DisplayMemberPath$
 Name��	 �� SelectedItem	 �� $ SelectedDirection�$ TwoWay=��� -   
 ��Name$
 ClearDirection��$��3��$��15��$��15��$��0q�$��0,0,10,0q�$��Right=�$��Center=�$��Center=�
������ $��0q�.��  $��15��$��15��$��Center=�$��Center=�
�������$ Close=�&   System.Windows.Controls.DataGrid  -     Name$ ClientsTable��$��1��   AutoGenerateColumns$
 True��   
IsReadOnly$
 True��   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$  ��   CellTemplate �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$
 Edit=�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Click��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. "	  Caliburn.Micro.ActionMessage	   	  
MethodName$ 
EditClient�� 	  
Parameters. 
  Caliburn.Micro.Parameter
   
  Value$ $datacontext��  $  �� �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$ Calendar=�   $ Click��. 	  $ AddVisit��. 
  $ $datacontext���� -   $
 CreateClient��$��1��$��15��$��15��$��0q�$��12q�$��Center=�$
��Left=�$	��Top=�$��Center=�
��� � �$��0q�.��  $��15��$��15��$��Center=�$��Center=�
�������$	 Add=�#  MaterialDesignThemes.Wpf.Card  $��1��   UniformCornerRadius$ 10Q�$	��100��$��30��$��Bottom=�$��Right=�$��30q�.���  �� $��30 ��� $��40 ��� $��30 �.+��� -   $
 SetPreviousPage�� &  "MaterialDesignFloatingActionButton#��[  $��30��$��30��
�������$��0q�$��0����Z� ��Z� .���� $��-5q�.+�  $ 	ArrowLeft=��� -    ��Name$ PagingString��$��Center=� �� TextAlignment$ Center=�$	��1/2��$��Center=�$��40��$
��Bold"�$��1���� -	   $
 SetNextPage��#��[  $��30��$��30��
�������$��0q�$��2����Z� ��Z� .���� $��-5q�.+�  $ 
ArrowRight=�