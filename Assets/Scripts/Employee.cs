using System;
using System.Runtime.CompilerServices;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;

public class Employee : MonoBehaviour
{
    public AudioManager audioManager;
    public Vector2 snapPoint;
    public string empName;
    public float competence = 1;
    private bool inMotion = false;
    public Sprite defaultSprite;
    public Sprite unitSprite;
    public Sprite stressedSprite;
    public Sprite deadSprite;
    private Vector2 startingPoint;
    public float physHealth, maxPhysHealth;
    public float mentHealth, maxMentHealth;
    [SerializeField] public float body, maxBody;
    [SerializeField] public float mind, maxMind;
    [SerializeField] public float heart, maxHeart;
    public bool isDead = false;
    public GameObject assignedUnit;
    public GameObject deadEmployee;
    [SerializeField] private HealthbarUI physHealthbar;
    [SerializeField] private HealthbarUI mentHealthbar;
    [SerializeField] private TextMeshProUGUI rank;
    
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private void Start()
    {
        GameObject existingObject = GameObject.Find(gameObject.name);
        if (existingObject != null && existingObject != gameObject)
        {
            Destroy(gameObject);
            return;
        }

        DontDestroyOnLoad(gameObject);
        startingPoint = gameObject.transform.position;
        snapPoint = gameObject.transform.position;
        physHealthbar.SetMaxHealth(maxPhysHealth);
        mentHealthbar.SetMaxHealth(maxMentHealth);
        rank.text = "Rank: " + Mathf.RoundToInt(competence);
        //GameManager.Instance.employeeRoster.Add(this);
        GetComponent<SpriteRenderer>().sprite = defaultSprite;
    }
    private void Update()
    {
        if (physHealth <= 0 || mentHealth <= 0)
        {
            isDead = true;
        }
    }
    public void UpdateSprite()
    {
        GetComponent<SpriteRenderer>().sprite = defaultSprite;
    }

    public void Moving()
    {
        audioManager.Play(audioManager.select);
        inMotion = true;
    }
    public void Stopped()
    {
        inMotion = false;
        gameObject.transform.position = snapPoint;
        if (assignedUnit != null)
        {
            if (assignedUnit.GetComponent<ContainmentUnit>() != null)
            {
                snapPoint = assignedUnit.GetComponent<ContainmentUnit>().GetEmpSnap();
                audioManager.Play(audioManager.lockin);
                //assignedUnit.GetComponent<ContainmentUnit>().mortem.Assign(this);
                gameObject.transform.position = snapPoint;
            }
            else if (assignedUnit.GetComponent<TrainingStation>() != null)
            {
                snapPoint = assignedUnit.GetComponent<TrainingStation>().snapPoint;
                audioManager.Play(audioManager.lockin);
                assignedUnit.GetComponent<TrainingStation>().employee = this;
                gameObject.transform.position = snapPoint;
            }
            else if (assignedUnit.GetComponent<HealthStation>() != null)
            {
                snapPoint = assignedUnit.GetComponent<HealthStation>().snapPoint;
                audioManager.Play(audioManager.lockin);
                assignedUnit.GetComponent<HealthStation>().employee = this;
                gameObject.transform.position = snapPoint;
            }
        }
        else
        {
            ResetSnap();
        }
    }
    public void ResetSnap()
    {
        snapPoint = startingPoint;
        if (!inMotion)
        {
            gameObject.transform.position = snapPoint;
        }
    }
    public void PassTag(string tag, float num = 0)
    {
        switch (tag)
        {
            case "scare":
                GetComponent<SpriteRenderer>().sprite = stressedSprite;
                break;
            case "mentdamage":
                SetMentHealth(-num);
                break;
            case "physdamage":
                SetPhysHealth(-num);
                break;
            
        }
    }
    public void AddCompetence(float addedCompetence)
    {
        competence += addedCompetence;
        competence = Mathf.Clamp(competence, 0, 5);

        rank.text = "Rank: " + Mathf.RoundToInt(competence);
    }
    public void SetPhysHealth(float healthChange)
    {
        if (healthChange < 0)
        {
            healthChange = healthChange * (1.5f - 0.25f * (competence - 1));
        }
        physHealth += healthChange;
        physHealth = Mathf.Clamp(physHealth, 0, maxPhysHealth);

        physHealthbar.SetHealth(physHealth);

        if (physHealth <= 0)
        {
            isDead = true;
            GetComponent<SpriteRenderer>().sprite = deadSprite;
            physHealthbar.gameObject.SetActive(false);
            mentHealthbar.gameObject.SetActive(false);
            rank.gameObject.SetActive(false);
        }
    }
    public void SetMentHealth(float healthChange)
    {
        if (healthChange < 0)
        {
            healthChange = healthChange * (1.5f - 0.25f * (competence - 1));
        }
        mentHealth += healthChange;
        mentHealth = Mathf.Clamp(mentHealth, 0, maxMentHealth);

        mentHealthbar.SetHealth(mentHealth);

        if (mentHealth <= 0)
        {
            isDead = true;
            GetComponent<SpriteRenderer>().sprite = deadSprite;
        }
    }
    public void FullRestore()
    {
        physHealth = maxPhysHealth;
        mentHealth = maxMentHealth;
        physHealthbar.SetHealth(physHealth);
        mentHealthbar.SetHealth(mentHealth);
    }
}
