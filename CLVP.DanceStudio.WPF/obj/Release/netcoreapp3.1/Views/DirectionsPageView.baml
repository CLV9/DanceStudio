   M S B A M L   `   `   `  ���� O  KCLVP.DanceStudio.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:CLVP.DanceStudio.WPF.ViewsCLVP.DanceStudio.WPF.Views  3    -CLVP.DanceStudio.WPF.Views.DirectionsPageView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     :local(clr-namespace:CLVP.DanceStudio.WPF.Views     b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  ^ ZCaliburn.Micro.Platform, Version=4.0.0.0, Culture=neutral, PublicKeyToken=8e5891231f2ed21f"calhttp://caliburnmicro.com  .��� 
�������  � RowDefinitions  �� $��50 ��� $��* �.+�'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�$��20��$��20��$��20,0,0,0q�$��Center=��� $��0��$	��450��$��
50,10,0,10q�$
��Left=�����  �� Path$ SearchString� �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�&   System.Windows.Controls.DataGrid  -     Name$ FilteredCollection��$��1��   AutoGenerateColumns$ False��   
IsReadOnly$
 True��   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn	   Header$	  ��
   CellTemplate
 �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$
 Edit=�*  $Microsoft.Xaml.Behaviors.Interaction   Triggers +  %Microsoft.Xaml.Behaviors.EventTrigger     	EventName$ Click��*  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. "  Caliburn.Micro.ActionMessage     
MethodName$
 Edit��   
Parameters. 	  Caliburn.Micro.Parameter	   	  Value$ $datacontext��  $	  ��
 �� .R��� ���#673ab7��Z� ��Z� .���� .+�  $��20��$��20��$ 
Calculator=�   $ Click��.   $ CalculateSalary��. 	  $ $datacontext��0
  *System.Windows.Controls.DataGridTextColumn
  $	 Название��-   Name��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� $
 Name��� -    ��Name$ Create��$��1��$��15��$��15��$��0q�$��12q�$��Center=�$
��Left=�$	��Top=�$��Center=�
��� � �$��0q�.��  $��15��$��15��$��Center=�$��Center=�
�������$	 Add=�