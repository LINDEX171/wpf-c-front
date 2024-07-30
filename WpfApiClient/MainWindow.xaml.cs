using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace WpfApiClient
{
    public partial class MainWindow : Window
    {
        private static readonly HttpClient client = new HttpClient();

        public MainWindow()
        {
            InitializeComponent();
        }

        private async void OnSendButtonClick(object sender, RoutedEventArgs e)
        {
            var nom = NomTextBox.Text;
            var prenom = PrenomTextBox.Text;
            var age = int.TryParse(AgeTextBox.Text, out var parsedAge) ? parsedAge : 0;

            var jsonData = new
            {
                nom = nom,
                prenom = prenom,
                age = age
            };

            var json = JsonConvert.SerializeObject(jsonData);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                var response = await client.PostAsync("http://localhost:8000/create.php", content);
                var responseString = await response.Content.ReadAsStringAsync();
                ResponseTextBlock.Text = $"Réponse de l'API : {responseString}";

                // Recharger les données après l'enregistrement
                await LoadDataAsync();

                // Réinitialiser les champs de saisie
                NomTextBox.Text = "";
                PrenomTextBox.Text = "";
                AgeTextBox.Text = "";
            }
            catch (Exception ex)
            {
                ResponseTextBlock.Text = $"Erreur : {ex.Message}";
            }
        }

        private async void OnLoadDataButtonClick(object sender, RoutedEventArgs e)
        {
            await LoadDataAsync();
        }

        private async Task LoadDataAsync()
        {
            try
            {
                var response = await client.GetStringAsync("http://localhost:8000/list.php");

                var users = JsonConvert.DeserializeObject<List<User>>(response);

                // Utiliser DataGrid pour l'affichage
                DataGrid.ItemsSource = users;
            }
            catch (JsonException jsonEx)
            {
                MessageBox.Show($"Erreur JSON : {jsonEx.Message}", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Erreur : {ex.Message}", "Erreur", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }

    public class User
    {
        public int Id { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public int Age { get; set; }
    }
}
