   M S B A M L   `   `   `  ����K  GWin_HadoopSwitch, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Win_HadoopSwitchWin_HadoopSwitch  5   	   !    Win_HadoopSwitch.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Win_HadoopSwitch     5   	     � Title$  Hadoop 集群启动器��5   	   $	��350��6   $	��525��6+    � 	Resources 5	       �� 
TargetType �� Property �� Value �� 
TargetType ��Name J� SnapsToDevicePixels ��Name	 �� Triggers
 P� Property P� Value �� 
TargetName��%�  '��       �� 5
   
   " ��6   .�5      ��  � �� �	#FF007ACC6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��$
 Bold"�6+   �� 5       � ��$
 12,8q�6(   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $ border��6!   #��z��61   #��z��6]   #��z��6�    . ._�5      �� $ contentPresenter��6/   #��z��6I   #��z��6}   #��z��6�   #��z��6�   #��z��6  # z 6F  5      	 5      P� 5      
 �@J�IsMouseOver . . �5   "   �� $ border��6?    � �� �	#FF009BFF6S   5      P� 5      
 � �� . . �5   "   �� $ border��6?    � �� �	#FF007ACC6S   5      P� 5      
 � {� .  . �5   "   �� $ border��6?    � �� �	#FFCCCCCC6S   �� 5    "    � �� �	#FF8888886?   5!      5#      5%      5&      5'      .��5(      �  � RowDefinitions 5)   
   �� 5*      $
��Auto �6   �� 5+      $
��Auto �6   �� 5,      $��* �6   �� 5-      $
��Auto �6   .+�5/   
   �� -   5         ��Name$ txtDirectoryPath��5/   !   $��0��6   $��目录位置：��6;   $��Center=�6H   $
��Bold"�6e   $��5q�6w   �� 50   
   -   5         ��Name$ btnSelectDirectory��50      $��1��6   $��选择 Hadoop 目录��6:   6Q   �� 51   
   $��2��6    �� Orientation$ 
Horizontal=�6"   $��Center=�6;   $��Center=�6X   .+�52      �� -   5        $ btnStartHadoop��52      $��启动 Hadoop 集群��6-   6D   �� 53      -   5        $ btnStopHadoop��53      $��关闭 Hadoop 集群��6,   6C   54      �� 55   
   -   5        $ 	txtStatus��55   !   $��3��6   $��Center=�64   $��Italic$�6Q   $��12(�6d   $��5q�6r   $
��Wrap=�6}   56      57      