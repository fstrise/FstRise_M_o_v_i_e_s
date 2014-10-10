﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Utils
/// </summary>
public class Utils
{

    // Symmetric algorithm interface is used to store the AES service provider
    private SymmetricAlgorithm AESProvider;

    private static int _iterations = 1000;
    private static int _keySize = 128;

    private static string _hash = "SHA1";
    private static string _salt = "aselrias38490a32"; // Random
    private static string _vector = "8947az34awl34kjq"; // Random


    /// <summary>
    /// Constructor for AES class that takes a byte array for the key
    /// </summary>
    /// <param name="key">256 bit key (32 bytes)</param>
    public Utils(byte[] key)
    {
        // Throw error if key is not 256 bits
        //if (key.Length != 32) throw new CryptographicException("Key must be 256 bits (32 bytes)");

        // Initialize AESProvider with AES algorithm service
        AESProvider = new AesCryptoServiceProvider();
        AESProvider.KeySize = _keySize;

        // Set the key for AESProvider
        AESProvider.Key = key;
    }

    /// <summary>
    /// Constructor for AES class that generates the key from a hashed, salted password
    /// </summary>
    /// <param name="password">Password used to generate the key (Minimum of 8 characters)</param>
    /// <param name="salt">Salt used to secure hash from rainbow table attacks (Minimum of 8 characters)</param>
    public Utils(string passphrase, string salt)
    {
        // Throw error if the password or salt are too short
        if (passphrase.Length < 8) throw new CryptographicException("Password must be at least 8 characters long");
        if (salt.Length < 8) throw new CryptographicException("Salt must be at least 8 characters long");

        // Initialize AESProvider with AES algorithm service
        AESProvider = new AesCryptoServiceProvider();
        AESProvider.KeySize = 256;

        // Initialize a hasher with the 256 bit SHA algorithm
        SHA256 sha256 = System.Security.Cryptography.SHA256.Create();

        // Hash salted password
        byte[] key = sha256.ComputeHash(UnicodeEncoding.Unicode.GetBytes(passphrase + salt));

        // Set the key for AESProvider
        AESProvider.Key = key;

    }

    /// <summary>
    /// Encrypts a string with AES algorithm
    /// </summary>
    /// <param name="plainText">String to encrypt</param>
    /// <returns>Encrypted string with IV prefix</returns>
    public string Encrypt(string plainText)
    {
        // Create new random IV
        AESProvider.GenerateIV();

        // Initialize encryptor now that the IV is set
        ICryptoTransform encryptor = AESProvider.CreateEncryptor();

        // Convert string to bytes
        byte[] plainBytes = UnicodeEncoding.Unicode.GetBytes(plainText);

        // Encrypt plain bytes
        byte[] secureBytes = encryptor.TransformFinalBlock(plainBytes, 0, plainBytes.Length);

        // Add IV to the beginning of the encrypted bytes
        secureBytes = AESProvider.IV.Concat(secureBytes).ToArray();

        // Return encrypted bytes as a string
        return Convert.ToBase64String(secureBytes);
    }

    /// <summary>
    /// Decrypts a string with AES algorithm
    /// </summary>
    /// <param name="secureText">Encrypted string with IV prefix</param>
    /// <returns>Decrypted string</returns>
    public string Decrypt(string secureText)
    {
        // Convert encrypted string to bytes
        byte[] secureBytes = Convert.FromBase64String(secureText);

        // Take IV from beginning of secureBytes
        AESProvider.IV = secureBytes.Take(16).ToArray();

        // Initialize decryptor now that the IV is set
        ICryptoTransform decryptor = AESProvider.CreateDecryptor();

        // Decrypt bytes after the IV
        byte[] plainBytes = decryptor.TransformFinalBlock(secureBytes, 16, secureBytes.Length - 16);

        // Return decrypted bytes as a string
        return UnicodeEncoding.Unicode.GetString(plainBytes);
    }


    public Utils()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}