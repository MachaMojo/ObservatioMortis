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
    // public float competence = 1;
    private bool inMotion = false;
    public Sprite defaultSprite;
    public Sprite unitSprite;
    public Sprite stressedSprite;
    public Sprite deadSprite;
    private Vector2 startingPoint;
    // public float physHealth, maxPhysHealth;
    // public float mentHealth, maxMentHealth;
    [SerializeField] public float body, maxBody;
    [SerializeField] public float mind, maxMind, mindResilience = 0;
    [SerializeField] public float heart, maxHeart = 100;
    public bool isDead = false;
    public bool isInsane = false;
    public GameObject assignedUnit;
    // public GameObject deadEmployee;
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
        physHealthbar.SetMaxHealth(maxBody);
        mentHealthbar.SetMaxHealth(maxMind);
        // rank.text = "Rank: " + Mathf.RoundToInt(competence);
        //GameManager.Instance.employeeRoster.Add(this);
        GetComponent<SpriteRenderer>().sprite = defaultSprite;
    }
    // private void Update()
    // {
    //     if (body <= 0)
    //     {
    //         isDead = true;
    //     }
    //     else if (mind <= 0)
    //     {
    //         isInsane = true;
    //     }
    // }
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
            case "addbody":
                ImproveBody(num);
                break;
            case "addmindres":
                ImproveMind(num);
                break;
            case "adjustheart":
                AdjustHeart(num);
                break;
        }
    }
    // public void AddCompetence(float addedCompetence)
    // {
    //     competence += addedCompetence;
    //     competence = Mathf.Clamp(competence, 0, 5);

    //     rank.text = "Rank: " + Mathf.RoundToInt(competence);
    // }


    public void ImproveBody(float bodyChange)
    {
        maxBody += bodyChange;
        maxBody = Mathf.Clamp(maxBody, 0, 150);
        body += bodyChange;
        body = Mathf.Clamp(body, 0, maxBody);
    }
    public void ImproveMind(float mindChange)
    {
        mindResilience += mindChange;
        mindResilience = Mathf.Clamp(mindResilience, 0, 5);
    }
    public void AdjustHeart(float heartChange)
    {
        if (heartChange < 0 && 50 < heart)
        {
            heartChange = heartChange * (100 - heart) / 50;
            heartChange = Mathf.Clamp(heartChange, 1, 100);
        }
        else if (heartChange > 0 && 50 > heart)
        {
            heartChange = heartChange * heart / 50;
            heartChange = Mathf.Clamp(heartChange, 1, 100);            
        }
        heart += heartChange;
        heart = Mathf.Clamp(heart, 0, 100);
    }

    public void SetPhysHealth(float healthChange)
    {
        // if (healthChange < 0)
        // {
        //     healthChange = healthChange * (1.5f - 0.25f * (competence - 1));
        // }
        body += healthChange;
        body = Mathf.Clamp(body, 0, maxBody);

        physHealthbar.SetHealth(body);

        if (body <= 0)
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
            healthChange = healthChange * (1.0f - 0.12f * mindResilience);
        }
        mind += healthChange;
        mind = Mathf.Clamp(mind, 0, maxMind);

        mentHealthbar.SetHealth(mind);

        if (mind <= 0)
        {
            isInsane = true;
            GetComponent<SpriteRenderer>().sprite = stressedSprite;
        }
    }
    public void FullRestore()
    {
        body = maxBody;
        mind = maxMind;
        physHealthbar.SetHealth(body);
        mentHealthbar.SetHealth(mind);
    }
}
