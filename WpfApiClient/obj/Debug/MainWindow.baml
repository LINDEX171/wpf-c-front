   M S B A M L   `   `   `  ����G  CWpfApiClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:WpfApiClientWpfApiClient  5   	       WpfApiClient.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:WpfApiClient     5   	     � Title$  
MainWindow��5   	   $	��585��6   $	��836��6)   .��5	      � .+�5
   
   �� $��10q�6   .+�5      �� $	��Nom��6   $��5q�6#   �� 5      -   5         ��Name$ 
NomTextBox��5      $��5q�6*   �� 5      $��Prénom��6   $��5q�6&   �� 5      -   5        $ PrenomTextBox��5      $��5q�6-   �� 5      $
��Âge��6   $��5q�6#   �� 5      -   5        $ 
AgeTextBox��5      $��5q�6*   �� 5      -   5        $��Envoyer��5      $��5q�6'   62   �� 5      -   5         ��Name$ ResponseTextBlock��5      $��5q�63   $
��Wrap=�6>   �� 5      $��10q�6   �� 5      -   5        $��Charger Données��5      $��5q�6/   6:   &   System.Windows.Controls.DataGrid  5      -   5          Name$ DataGrid��5      $��5q�6)      AutoGenerateColumns .     CanUserAddRows .     CanUserDeleteRows .     Columns 5       0  *System.Windows.Controls.DataGridTextColumn  5!      ,  &System.Windows.Controls.DataGridColumn   Header$	 Nom��6)   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 6N   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 66   �� *Nom+6N     5"      $ Prénom��6)   $	 * 6T   
 69   �� *Prenom+6T     5#      $
 Âge��6)   $	 * 6N   
 66   �� *Age+6N   5%      5&      5'      5(      