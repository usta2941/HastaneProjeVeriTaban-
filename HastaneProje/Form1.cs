using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HastaneProje
{
    public partial class Form1 : Form
    {
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost;port=5432;Database=hastaneOtomasyon; user ID=postgres;password=1234");
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e) // hasta ekleme
        {
            
           baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into personel (personelNo,adi,soyadi,personelTipi) values(@p1,@p2,@p3,@p4)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(hastaID_text.Text));
            komut1.Parameters.AddWithValue("@p2", DoktorIsım_text.Text);
            komut1.Parameters.AddWithValue("@p3", DoktorSoyad_text.Text);
            string doktor = "doktor";
            komut1.Parameters.AddWithValue("@p4", doktor);
            komut1.ExecuteNonQuery(); 
            baglanti.Close();
            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("insert into doktor(personelNo,departmanID) values(@p1,@p2)", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(hastaID_text.Text));
            komut2.Parameters.AddWithValue("@p2", int.Parse("1"));
            komut2.ExecuteNonQuery();
            baglanti.Close();
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("insert into hasta(id,ad,soyad,doktorID) values(@p1,@p2,@p3,@p4)", baglanti);
            komut3.Parameters.AddWithValue("@p1", int.Parse(hastaID_text.Text));
            komut3.Parameters.AddWithValue("@p2", hastaIsım_text.Text);
            komut3.Parameters.AddWithValue("@p3", hastaSoyad_text.Text);
            komut3.Parameters.AddWithValue("@p4", int.Parse(hastaID_text.Text));
            komut3.ExecuteNonQuery();
            baglanti.Close();



        }

        private void button3_Click(object sender, EventArgs e)// listele
        {
            baglanti.Open();
            string sorgu = "select * from hasta";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
