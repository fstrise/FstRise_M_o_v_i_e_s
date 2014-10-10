using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string _hash = "SHA1";
        string _salt = "aselrias38490a32"; // Random
        string _vector = "8947az34awl34kjq"; // Random
        int _keySize = 256;
        int _iterations = 1000;
        byte[] saltBytes = Encoding.ASCII.GetBytes(_salt);

        // Derive a cryptographic key: PBKDF2
        PasswordDeriveBytes _passwordBytes = new PasswordDeriveBytes("passphrase", saltBytes, _hash, _iterations);
        byte[] keyBytes = _passwordBytes.GetBytes(_keySize / 8);

        Utils aes = new Utils(keyBytes);

        /*** encrypt */
        String ciphertext = aes.Encrypt("Duy236547@");

        /*** decrypt */
        String plaintext = aes.Decrypt(ciphertext);

     
        String dd = "";
    }
}