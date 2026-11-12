using System.Collections.Generic;
using UnityEngine;

public class NameBank : MonoBehaviour
{
    List<string> names = new List<string>
        {
            "James", "Mary", "John", "Patricia", "Robert", 
            "Jenn", "Michael", "Linda", "William", "Elizabeth",
            "David", "Barbara", "Richard", "Susan", "Joseph", 
            "Jessica", "Thomas", "Sarah", "Charles", "Karen",
            "Chris", "Nancy", "Daniel", "Lisa", "Matthew", 
            "Betty", "Anthony", "Margaret", "Mark", "Sandra",
            "Elijah", "Angela", "Ramiro", "Prince", "D", "Ashley",
            "Marcus", "Madison", "Bingby", "Delilah", "Jamanthifer",
            "Bernard", "Sydney", "Harmonia", "Sam"
        };

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    public string GetName() => names[Random.Range(0, names.Count - 1)];
}
